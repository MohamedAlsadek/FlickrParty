//
//  CustomTableViewCell.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "LayoutManager.h"
#import "UIBuilder.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface CustomTableViewCell : UITableViewCell


// UIElements
@property UIView *viewImage;
@property UIImageView *imageViewPreview;
@property UILabel *labelTitle;

// Methods
- (void) setupCellWithData:(Photo *)photo;

@end
