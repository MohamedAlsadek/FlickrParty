//
//  LayoutManager.h
//  LayoutManager
//
//  Created by Mohamed Alsadek on 11/26/15.
//  Copyright (c) 2015 Mohamed Alsadek. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit ;


@interface LayoutManager : NSObject



#pragma mark - top - down - left - right

// set padding in parent
+(void) setConstraintView:(UIView *) child toSuperView:(UIView *) superview WithPadding:(UIEdgeInsets) padding ;

/*
 Note: view2 can be the superview if the relation between child and parent , if the relation between two childs then view1 = child1 and view2 = child 2 and superview = parent
 */

// Set left constraint
+ (void) setConstraintLeftView:(UIView *) view1 toView:(UIView *)view2 AndSuperView:(UIView *) superview withConstant :(float) constant ;

// Set right constraint
+ (void) setConstraintRightView:(UIView *) view1 toView:(UIView *)view2 AndSuperView:(UIView *) superview withConstant :(float) constant ;

// Set top constraint
+ (void) setConstraintTopView:(UIView *) view1 toView:(UIView *)view2 AndSuperView:(UIView *) superview withConstant :(float) constant ;

// Set bottom constraint
+ (void) setConstraintBottomView:(UIView *) view1 toView:(UIView *)view2 AndSuperView:(UIView *) superview withConstant :(float) constant ;

#pragma mark - width - hegiht
// Set (width and height) constriants
+ (void) setConstraintSizeForView:(UIView *) view withWidth:(float) width andHeight:(float) height ;

// Set width constraint
+ (void) setConstraintWidthForView:(UIView *) view WithConstant:(float) constant ;

// Set height constraint
+ (void) setConstraintHeightForView:(UIView *) view WithConstant:(float) constant ;


#pragma mark center 
// Add view in center of other view.
+ (void) setConstraintCenterForView :(UIView *) view1 andView2:(UIView *) view2 inView:(UIView *) superview ;

@end
