//
//  APIParams.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 5/4/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#ifndef APIParams_h
#define APIParams_h


typedef NS_ENUM(NSInteger, FlickrServices) {
    FlickrServicesTaggedParty,
    FlickrServicesNearstToUserLocation
};


// Flickr API Keys
static NSString* const kAPIKey     = @"1c01151fda3e12a88a80e8edd17f43de";
static NSString* const kSecretKey  = @"ghvr3RrkBoFuVAMQDpm3pV";


// Flickr Method Names
static NSString* const kBaseURL             = @"https://api.flickr.com/services/rest/?method=";
static NSString* const kSearchForTagMethod  = @"flickr.photos.search";

#pragma mark - Basic Error Handling
static const NSInteger KBadRequestError   = 400;
static const NSInteger KUnauthorizedError = 401;
static const NSInteger KForbiddenError    = 403;

static NSString * const kMFAHttpSessionManagerErrorDomain = @"MFAErrorDomain";
static NSString * const kMFAHttpSessionManagerErrorMessage = @"MFAErrorMessage";


#pragma mark - Model - Photo

static NSString* const kPhotos = @"photos";
static NSString* const kPhoto = @"photo";
static NSString* const kFarm = @"farm";
static NSString* const kServer = @"server";
static NSString* const kId = @"id";
static NSString* const kOwner = @"owner";
static NSString* const kSecret = @"secret";
static NSString* const kTitle = @"title";
static NSString* const kIsFamily = @"isfamily";
static NSString* const kIsFriend = @"isfriend";
static NSString* const kIsPublic = @"ispublic";


#endif /* APIParams_h */
