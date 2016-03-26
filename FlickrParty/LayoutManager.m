//
//  LayoutManager.m
//  LayoutManager
//
//  Created by Mohamed Alsadek on 11/26/15.
//  Copyright (c) 2015 Mohamed Alsadek. All rights reserved.
//

#import "LayoutManager.h"

@implementation LayoutManager

/// add (top , down , left , right ) constraints for child in parent
+ (void) setConstraintView:(UIView *)child toSuperView:(UIView *)superview WithPadding:(UIEdgeInsets)padding {
    
    [self setConstraintLeftView:child toView:superview AndSuperView:superview withConstant:padding.left] ;
    [self setConstraintRightView:child toView:superview AndSuperView:superview withConstant:padding.right] ;
    [self setConstraintTopView:child toView:superview AndSuperView:superview withConstant:padding.top] ;
    [self setConstraintBottomView:child toView:superview AndSuperView:superview withConstant:padding.bottom] ;

}

#pragma mark - top - down - left - right
// add left constraint
+ (void) setConstraintLeftView:(UIView *)view1 toView:(UIView *)view2 AndSuperView:(UIView *)superview withConstant:(float)constant{
    
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    if (view2 != superview) {
        view2.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:view1
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view2
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1.0
                                                                constant:constant] ;
    
    [superview addConstraint:left];
}

// add Right constraint
+ (void) setConstraintRightView:(UIView *) view1 toView:(UIView *)view2 AndSuperView:(UIView *)superview withConstant:(float)constant{
    
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    if (view2 != superview) {
        view2.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:view1
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view2
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1.0
                                                                constant:-constant] ;
    
    [superview addConstraint:right];
}

/// add Top constraint
+ (void) setConstraintTopView:(UIView *)view1 toView:(UIView *)view2 AndSuperView:(UIView *) superview withConstant :(float) constant{
    
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    if (view2 != superview) {
        view2.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view1
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view2
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:constant] ;
    
    [superview addConstraint:top];
}

// add bottom constraint
+ (void) setConstraintBottomView:(UIView *)view1 toView:(UIView *)view2 AndSuperView:(UIView *)superview withConstant :(float) constant{
    
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    if (view2 != superview) {
        view2.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view1
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:view2
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:-constant] ;
    
    [superview addConstraint:bottom];
}

#pragma mark - width - hegiht 

// Set width and height constraint
+ (void) setConstraintSizeForView:(UIView *)view withWidth:(float) width andHeight:(float)height {
    [self setConstraintWidthForView:view WithConstant:width] ;
    [self setConstraintWidthForView:view WithConstant:height] ;
}

// set width constraint
+ (void)setConstraintWidthForView:(UIView *)view WithConstant:(float)constant {
    view.translatesAutoresizingMaskIntoConstraints = NO;

    [view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                      multiplier:1.0
                                                        constant:constant]];
}

// set height constraint.
+ (void)setConstraintHeightForView:(UIView *)view WithConstant:(float) constant {
    view.translatesAutoresizingMaskIntoConstraints = NO;

    [view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                      constant:constant]];
}

#pragma mark center 

/// make child center in parent. 
+ (void)setConstraintCenterForView:(UIView *)view1 andView2:(UIView *)view2 inView:(UIView *)superview {
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    if (view2 != superview) {
        view2.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [superview addConstraint:xCenterConstraint];
    
    NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    [superview addConstraint:yCenterConstraint];
}


@end
