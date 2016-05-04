//
//  UIBuilder.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "UIBuilder.h"

@implementation UIBuilder

/// Configure the table view that holds the result.
+ (UITableView *)getConfiguredTableViewToFillParent:(UIView *)parent {
    
    UITableView *tableview = [[UITableView alloc] init] ;
    
    tableview.rowHeight = 80;
    tableview.scrollEnabled = YES;
    tableview.showsVerticalScrollIndicator = YES;
    tableview.userInteractionEnabled = YES;
    tableview.bounces = YES;
    tableview.backgroundColor = [UIColor clearColor] ;
    tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine ;
    
    [parent addSubview:tableview] ;
    
    [LayoutManager setConstraintView:tableview toSuperView:parent WithPadding:UIEdgeInsetsMake(0, 0, 0, 0)] ;
    
    return tableview ;
}

// general label to use through the application
+ (UILabel *)generalLabel {
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.textColor = [UIColor blackColor] ;
    labelTitle.numberOfLines = 3 ;
    labelTitle.lineBreakMode = NSLineBreakByWordWrapping ;
    labelTitle.backgroundColor = [UIColor clearColor] ;
    labelTitle.font = [UIFont systemFontOfSize:16.0] ;
    
    return labelTitle ;
}
@end
