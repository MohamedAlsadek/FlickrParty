//
//  Photo.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject


@property NSString *farm ;
@property NSString *photoId;
@property NSString *owner;
@property NSString *secret;
@property NSString *server;
@property NSString *title ;
@property NSNumber *isfamily;
@property NSNumber *isfriend;
@property NSNumber *ispublic;

- (void) initWithObject:(id) object ;
- (NSURL *) photoURL ;
+ (NSArray *)getPhotosObjectsFromJson:(NSDictionary *)photosObj ;

@end
