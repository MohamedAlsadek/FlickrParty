//
//  PhotosListViewModel.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PhotosListViewModel : NSObject


@property (nonatomic, readonly) NSArray *photosList;

#pragma mark - Initialization
- (instancetype)initWithDelegate:(id)delegate;

#pragma mark - fetching data
- (void)fetchDataForLocation:(CLLocationCoordinate2D)location;
- (void)fetchDataPartyPhotosData;

#pragma mark - Util
- (void)cleanPhotosList;

@end
