//
//  FlickrClient.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "FlickrClient.h"

@implementation FlickrClient


#pragma mark - Flickr Methods
/// Search for specific tag
+ (void)searchForPhotoWithTag:(NSString *)tag :(void (^)(NSArray *photos, NSError *error))complitionBlock {

    //set request parameters
    NSMutableDictionary *params = [FlickrClient flickrBaseRequestParameters] ;
    [params setValue:tag forKey:@"tags"] ;
    
    // call service and parse the result
    [self performRequestWithMethod:kSearchForTagMethod andParameters:params andComplition:^(id responseObject, NSError *error) {
        complitionBlock([Photo getPhotosObjectsFromJson:responseObject], error) ;
    }] ;
}


+ (void)photosForLocation:(CLLocationCoordinate2D)location :(void (^)(NSArray *photos, NSError *error))complitionBlock {
    //set request parameters
    NSMutableDictionary *params = [FlickrClient flickrBaseRequestParameters] ;
    [params setValue:[NSString stringWithFormat:@"%f" , location.latitude] forKey:@"lat"] ;
    [params setValue:[NSString stringWithFormat:@"%f" , location.longitude] forKey:@"lon"] ;
    
    // call service and parse the result
    [self performRequestWithMethod:kSearchForTagMethod andParameters:params andComplition:^(id responseObject, NSError *error) {
        complitionBlock([Photo getPhotosObjectsFromJson:responseObject], error) ;
    }] ;
}

#pragma mark - Base Service Handler
// get more photos for specific user
+ (void)performRequestWithMethod:(NSString *)method andParameters:(NSDictionary *)params
                     andComplition:(void (^)(id responseObject, NSError *error))complitionBlock {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Cache the requests
    configuration.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad ;
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    // Base URL
    NSString *URL = [NSString stringWithFormat:@"%@%@" ,kBaseURL, method] ;
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URL parameters:params error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            [ErrorHandling generalError] ;
        }
        complitionBlock(responseObject, error);
    }];
    
    [dataTask resume];
}

+ (NSMutableDictionary *)flickrBaseRequestParameters {
    
    NSMutableDictionary *requestParams = [[NSMutableDictionary alloc]
                                          initWithDictionary:@{@"api_key" : kAPIKey ,
                                                               @"format" : @"json" ,
                                                               @"nojsoncallback" : @"1"}] ;
    
    return requestParams ;

}

@end

