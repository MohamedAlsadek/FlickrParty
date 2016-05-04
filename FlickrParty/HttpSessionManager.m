//
//  HttpSessionManager.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//


#import "HttpSessionManager.h"

@implementation HttpSessionManager


#pragma mark - INIT
- (instancetype)initWithBaseURL:(NSString *)url {
    
    self = [super initWithBaseURL:[NSURL URLWithString:url]];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}


#pragma mark - Public GET/POST

- (NSURLSessionDataTask *)getDataFromResource:(NSString *)resource parameters:(id)parameters success:(APISuccessBlock)success failure:(APIFailureBlockWithErrorMessage)failure {
    
    NSURLSessionDataTask *task = [self GET:resource parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success (responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error && failure) {
            failure([error.userInfo objectForKey:kMFAHttpSessionManagerErrorMessage]);
        }
    }];
    
    return task;
}

#pragma mark - Override Methods

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                            completionHandler:(void (^)(NSURLResponse *, id, NSError *))originalCompletionHandler
{
    
    return [super dataTaskWithRequest:request
                    completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                        
                        // If there's an error, store the response in it if we've got one.
                        NSError *formatError = [self formatErrorWithOriginalError:error responseObject:responseObject];
                        
                        // Call the original handler.
                        if (originalCompletionHandler) {
                            originalCompletionHandler(response, responseObject, formatError);
                        }
                    }];
}

#pragma mark - Private Methods

- (NSError *)formatErrorWithOriginalError:(NSError *)error responseObject:(id)responseObject {
    
    if (!error) {
        return nil;
    }
    
    NSString *errorMessage = responseObject[@"message"]?responseObject[@"message"]:error.description;
    NSInteger code = [responseObject[@"code"] integerValue];
    
    return [NSError errorWithDomain:kMFAHttpSessionManagerErrorDomain
                               code:code
                           userInfo:@{kMFAHttpSessionManagerErrorMessage:errorMessage}];
}



@end
