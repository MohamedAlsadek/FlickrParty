//
//  ErrorHandling.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "ErrorHandling.h"

@implementation ErrorHandling

+ (void)generalError {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error in connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] ;
    [alert show] ;
}

@end
