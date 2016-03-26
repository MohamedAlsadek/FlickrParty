//
//  FlickrClient.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <CoreLocation/CoreLocation.h>

#import "ErrorHandling.h"
#import "Photo.h"
#import "Constants.h"

@interface FlickrClient : NSObject


// search for tag
+ (void)searchForPhotoWithTag:(NSString *)tag :(void (^)(NSArray *photos, NSError *error))complitionBlock;

// get nearst photos for location
+ (void)photosForLocation:(CLLocationCoordinate2D)location :(void (^)(NSArray *photos, NSError *error))complitionBlock;

@end
