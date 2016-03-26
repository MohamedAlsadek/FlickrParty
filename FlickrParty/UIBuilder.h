//
//  UIBuilder.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LayoutManager.h"

@interface UIBuilder : NSObject

+ (UITableView *)getConfiguredTableViewToFillParent:(UIView *)parent ;
+ (UILabel *)generalLabel ;

@end
