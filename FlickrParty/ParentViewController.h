//
//  ParentViewController.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutManager.h"

@interface ParentViewController : UIViewController

/// UIElements.
@property UIActivityIndicatorView *spinner ;

//Loading Indicator Functions
-(void) showLoadingIndicator ;
-(void) hideLoadingIndicator ;

@end
