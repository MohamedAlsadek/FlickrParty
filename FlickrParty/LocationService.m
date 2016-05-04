//
//  LocationService.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "LocationService.h"

@interface LocationService ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *gps;

@end


@implementation LocationService

- (void)startUpdatingLocation   {
    
    if (!self.gps) {
        self.gps = [[CLLocationManager alloc] init];
        self.gps.delegate = self;
        [self.gps setDesiredAccuracy:kCLLocationAccuracyBest];
        
        if (![self isLocationServicesEnabled]) {
            
            if (self.updateLocation) {
                self.updateLocation(CLLocationCoordinate2DMake(0, 0), @"Can't find user location, please enable location service");
            }
            
            return;
        }
        switch ([CLLocationManager authorizationStatus]) {
            case kCLAuthorizationStatusDenied:
            case kCLAuthorizationStatusRestricted:
            {
                // Error AuthorizationStatusRestricted
                
                if (self.updateLocation) {
                    self.updateLocation(CLLocationCoordinate2DMake(0, 0), @"Can't get userlocation, please enable location service");
                }
                return;
            }
                break;
            case kCLAuthorizationStatusNotDetermined:
                if([self.gps respondsToSelector:@selector(requestWhenInUseAuthorization)])
                    [self.gps requestWhenInUseAuthorization];
                break;
            default:
                break;
        }
    }
    
    [self.gps startUpdatingLocation];
}


- (BOOL)isLocationServicesEnabled
{
    return [CLLocationManager locationServicesEnabled];
}
- (BOOL)hasLocationAccessPermission
{
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        return YES;
    }
    return NO;
}

- (void)stopUpdatingLocation    {
    
    [self.gps stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error  {
    // Error get location
    
    if (self.updateLocation) {
        self.updateLocation(CLLocationCoordinate2DMake(0, 0), error.localizedDescription);
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation   {
    NSLog(@"didUpdateToLocation: %@", newLocation);
    
    if (self.updateLocation) {
        [self stopUpdatingLocation];
        self.updateLocation(newLocation.coordinate, nil);
    }
}


@end