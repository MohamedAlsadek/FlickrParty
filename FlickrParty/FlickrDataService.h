//
//  FlickrDataService.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "HttpSessionManager.h"
#import "APIService.h"
#import "Photo.h"

typedef void(^DataFailureBlock)(NSString *errorMsg);
typedef void(^DataSuccessBlock)(id result);


@interface FlickrDataService : NSObject


#pragma mark - Flickr Services
- (void)searchForPhotoWithTag:(NSString *)tag :(DataSuccessBlock)success failure:(DataFailureBlock)failure;

- (void)photosForLocation:(CLLocationCoordinate2D)location :(DataSuccessBlock)success failure:(DataFailureBlock)failure;


@end
