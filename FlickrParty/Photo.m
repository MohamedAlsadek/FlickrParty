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
    
    self.farm = [[object objectForKey:@"farm"] stringValue] ;
    self.server = [object objectForKey:@"server"] ;
    self.photoId = [object objectForKey:@"id"] ;
    self.owner = [object objectForKey:@"owner"];
    self.secret = [object objectForKey:@"secret"];
    self.title  = [object objectForKey:@"title"];
    
    self.isfamily = [NSNumber numberWithBool:[[object objectForKey:@"isfamily"] boolValue]];
    self.isfriend = [NSNumber numberWithBool:[[object objectForKey:@"isfriend"] boolValue]];
    self.ispublic = [NSNumber numberWithBool:[[object objectForKey:@"ispublic"] boolValue]];
}

- (NSURL *)photoURL {
    NSString *imageURL = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg" , self.farm , self.server , self.photoId , self.secret] ;

    return [NSURL URLWithString:imageURL] ;
}

#pragma mark - Parsing
// convert Json photos to Objects
+ (NSArray *)getPhotosObjectsFromJson:(NSDictionary *)photosObj {
    
    NSDictionary *parent = [photosObj objectForKey:@"photos"] ;
    NSArray *photos = [parent objectForKey:@"photo"] ;
    
    NSMutableArray *photoObjects = [[NSMutableArray alloc] init] ;
    
    for (int i = 0; i < photos.count; ++i) {
        Photo *tempPhoto = [[Photo alloc] init] ;
        [tempPhoto initWithObject:[photos objectAtIndex:i]] ;
        [photoObjects addObject:tempPhoto] ;
    }
    
    return photoObjects ;
    
}

@end
