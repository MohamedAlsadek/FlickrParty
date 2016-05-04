//
//  PhotosListViewModel.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "APIParams.h"

@interface PhotosListViewModel : NSObject


@property (nonatomic, readonly) NSArray *photosList;

#pragma mark - Initialization
- (instancetype)initWithDelegate:(id)delegate;

#pragma mark - fetching data
- (void) fetchDataWithService:(FlickrServices) service;

#pragma mark - Util
- (void)cleanPhotosList;

@end
