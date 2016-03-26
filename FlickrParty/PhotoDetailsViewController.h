//
//  PhotoDetailsViewController.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "Photo.h"
#import "ParentViewController.h"

@interface PhotoDetailsViewController : ParentViewController

@property Photo* photo;

@end
