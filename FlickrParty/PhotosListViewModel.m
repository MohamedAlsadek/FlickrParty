//
//  PhotosListViewModel.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "PhotosListViewModel.h"
#import "ViewModelUpdateUIDelegate.h"
#import "FlickrDataService.h"
#import "Photo.h"
#import "LocationService.h"
#import "ErrorHandling.h"


@interface PhotosListViewModel ()

@property (nonatomic, strong) LocationService *locationService;


@property (nonatomic, strong) NSArray *photosList;

@property (nonatomic, strong) id <ViewModelUpdateUIDelegate>updateUiDelegate;
@property (strong, nonatomic) FlickrDataService *flickrDataService;

@end

@implementation PhotosListViewModel


#pragma mark - CustomInit

- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        
        _updateUiDelegate = delegate;
        _flickrDataService = [[FlickrDataService alloc] init];
        _locationService = [[LocationService alloc] init];
    }
    return self;
}

#pragma mark - fetching data
- (void) fetchDataWithService:(FlickrServices) service {
    
    switch (service) {
        case FlickrServicesTaggedParty: {
            [self fetchDataPartyPhotosData];
        }
            break;
            
        case FlickrServicesNearstToUserLocation: {
            [self fetchDataForLocation];
        }
            break;
            
        default:
            break;
    }
}

- (void)fetchDataForLocation {
    
    __weak __typeof(self)weakSelf = self;
    [_locationService startUpdatingLocation];
    _locationService.updateLocation = ^(CLLocationCoordinate2D location, NSString *errorMSG) {
        if (!errorMSG) {
            [weakSelf fetchDataForLocation:location];
        }else {
            weakSelf.photosList = [[NSArray alloc] init];
            [ErrorHandling generalErrorWithDescription:errorMSG];
        }
    };
}

- (void)fetchDataForLocation:(CLLocationCoordinate2D)location {
    [self.flickrDataService photosForLocation:location :^(id result) {
        
        self.photosList = (NSArray *)result;
        
    } failure:^(NSString *errorMsg) {
        
        self.photosList = [[NSArray alloc] init];
        [ErrorHandling generalError];
    }];
}
- (void)fetchDataPartyPhotosData {
    [self.flickrDataService searchForPhotoWithTag:@"party" :^(id result) {
        
        self.photosList = (NSArray *)result;
        
    } failure:^(NSString *errorMsg) {
        
        self.photosList = [[NSArray alloc] init];
        [ErrorHandling generalError];
    }];
}


#pragma mark - override setters

- (void)setPhotosList:(NSArray *)photosList {
    _photosList = photosList;
    [self callUpdateUiDelegate];
}

#pragma mark - Private helpers

- (void)callUpdateUiDelegate {
    if (self.updateUiDelegate && [self.updateUiDelegate respondsToSelector:@selector(updateUI)]) {
        [self.updateUiDelegate updateUI];
    }
}

#pragma mark - Util
- (void)cleanPhotosList {
    self.photosList = [[NSArray alloc] init];
}


@end
