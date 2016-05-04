//
//  APIService.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "APIService.h"


@interface APIService ()

@property (nonatomic, strong) HttpSessionManager *sessionManager;

@end


@implementation APIService


- (instancetype)init {
    self  = [super init];
    
    if (self) {
        _sessionManager = [[HttpSessionManager alloc] initWithBaseURL:kBaseURL];
    }
    return self;
}

- (void)searchForPhotoWithTag:(NSString *)tag :(APISuccessBlock)success failure:(APIFailureBlockWithErrorMessage)failure {
 
    //set request parameters
    NSMutableDictionary *params = [self flickrBaseRequestParameters] ;
    [params setValue:tag forKey:@"tags"] ;
    NSString *busListResourceUrl = [NSString stringWithFormat:@"%@%@", kBaseURL,kSearchForTagMethod];
    [self.sessionManager getDataFromResource:busListResourceUrl parameters:params success:success failure:failure];
}

- (void)photosForLocation:(CLLocationCoordinate2D)location :(APISuccessBlock)success failure:(APIFailureBlockWithErrorMessage)failure {
    //set request parameters
    NSMutableDictionary *params = [self flickrBaseRequestParameters] ;
    [params setValue:[NSString stringWithFormat:@"%f" , location.latitude] forKey:@"lat"] ;
    [params setValue:[NSString stringWithFormat:@"%f" , location.longitude] forKey:@"lon"] ;
    NSString *busListResourceUrl = [NSString stringWithFormat:@"%@%@", kBaseURL,kSearchForTagMethod];
    
    [self.sessionManager getDataFromResource:busListResourceUrl parameters:params success:success failure:failure];
}

- (NSMutableDictionary *)flickrBaseRequestParameters {
    
    NSMutableDictionary *requestParams = [[NSMutableDictionary alloc]
                                          initWithDictionary:@{@"api_key" : kAPIKey ,
                                                               @"format" : @"json" ,
                                                               @"nojsoncallback" : @"1"}] ;
    
    return requestParams ;
    
}


@end
