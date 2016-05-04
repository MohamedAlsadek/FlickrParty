//
//  MainViewController.h
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"
#import "CustomTableViewCell.h"
#import "ViewModelUpdateUIDelegate.h"
#import "FlickrDataService.h"
#import "PhotoDetailsViewController.h"
#import "ArrayDataSource.h"
#import "PhotosListViewModel.h"
#import "LocationService.h"
#import "ErrorHandling.h"

@interface MainViewController : ParentViewController <UITableViewDelegate, ViewModelUpdateUIDelegate>

@end
