//
//  HttpSessionManager.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "APIParams.h"


typedef enum {
    ConnectionFail,
    EmptyData
} FailureType;

typedef void(^APIFailureBlock)(NSString *errorMsg , FailureType failureType);
typedef void(^APIFailureBlockWithErrorMessage)(NSString *errorMsg);
typedef void(^APISuccessBlock)(id result);


@interface HttpSessionManager : AFHTTPSessionManager

- (instancetype)initWithBaseURL:(NSString *)url;
- (NSURLSessionDataTask *)getDataFromResource:(NSString *)resource parameters:(id)parameters success:(APISuccessBlock)success failure:(APIFailureBlockWithErrorMessage)failure;


@end