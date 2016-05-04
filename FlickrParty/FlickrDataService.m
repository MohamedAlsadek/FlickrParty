//
//  FlickrDataService.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "FlickrDataService.h"

@implementation FlickrDataService


#pragma mark - Flickr Services
- (void)searchForPhotoWithTag:(NSString *)tag :(DataSuccessBlock)success failure:(DataFailureBlock)failure {
    APIService *apiService = [[APIService alloc] init];

    [apiService searchForPhotoWithTag:tag :^(id result) {
        if (result && ![result isEqual:[NSNull null]] && [result isKindOfClass:[NSDictionary class]]) {
            if (success) {
                success([Photo getPhotosObjectsFromJson:result]);
            }
        }
    } failure:^(NSString *errorMsg) {
        if (failure) {
            failure (errorMsg);
        }
    }];
}

- (void)photosForLocation:(CLLocationCoordinate2D)location :(DataSuccessBlock)success failure:(DataFailureBlock)failure {
    APIService *apiService = [[APIService alloc] init];
    
    [apiService photosForLocation:location :^(id result) {
        if (result && ![result isEqual:[NSNull null]] && [result isKindOfClass:[NSDictionary class]]) {
            if (success) {
                success([Photo getPhotosObjectsFromJson:result]);
            }
        }
    } failure:^(NSString *errorMsg) {
        if (failure) {
            failure (errorMsg);
        }
    }];
}

@end
