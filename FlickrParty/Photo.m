//
//  Photo.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(void) initWithObject:(id) object {
    
    self.farm = [[object objectForKey:kFarm] stringValue] ;
    self.server = [object objectForKey:kServer] ;
    self.photoId = [object objectForKey:kId] ;
    self.owner = [object objectForKey:kOwner];
    self.secret = [object objectForKey:kSecret];
    self.title  = [object objectForKey:kTitle];
    
    self.isfamily = [NSNumber numberWithBool:[[object objectForKey:kIsFamily] boolValue]];
    self.isfriend = [NSNumber numberWithBool:[[object objectForKey:kIsFriend] boolValue]];
    self.ispublic = [NSNumber numberWithBool:[[object objectForKey:kIsPublic] boolValue]];
}

- (NSURL *)photoURL {
    NSString *imageURL = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg" , self.farm , self.server , self.photoId , self.secret] ;

    return [NSURL URLWithString:imageURL] ;
}

#pragma mark - Parsing
// convert Json photos to Objects
+ (NSArray *)getPhotosObjectsFromJson:(NSDictionary *)photosObj {
    
    NSDictionary *parent = [photosObj objectForKey:kPhotos] ;
    NSArray *photos = [parent objectForKey:kPhoto] ;
    
    NSMutableArray *photoObjects = [[NSMutableArray alloc] init] ;
    
    for (int i = 0; i < photos.count; ++i) {
        Photo *tempPhoto = [[Photo alloc] init] ;
        [tempPhoto initWithObject:[photos objectAtIndex:i]] ;
        [photoObjects addObject:tempPhoto] ;
    }
    
    return photoObjects ;
    
}

@end
