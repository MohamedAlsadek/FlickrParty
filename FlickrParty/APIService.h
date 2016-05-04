//
//  APIService.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "HttpSessionManager.h"

@interface APIService : NSObject


#pragma mark - Flickr Services
- (void)searchForPhotoWithTag:(NSString *)tag :(APISuccessBlock)success failure:(APIFailureBlockWithErrorMessage)failure;

- (void)photosForLocation:(CLLocationCoordinate2D)location :(APISuccessBlock)success failure:(APIFailureBlockWithErrorMessage)failure;

@end
