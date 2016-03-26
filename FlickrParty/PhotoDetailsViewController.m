//
//  PhotoDetailsViewController.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "PhotoDetailsViewController.h"

@interface PhotoDetailsViewController () <UIScrollViewDelegate>{
    UIImageView *imageView ;
}

@end

@implementation PhotoDetailsViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view

    [self initUI] ; 
}

- (void)initUI {
    [self addingImageView];
    self.title = self.photo.title ; 
    [self.view layoutIfNeeded] ;
}

- (void) addingImageView {
    // Do any additional setup after loading the view, typically from a nib.
    
    imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSURL *imageURL = [self.photo photoURL] ;
    if (imageURL) {
        [imageView setImageWithURL:imageURL placeholderImage:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] ;
    }
    [self.view addSubview:imageView]; 
    [LayoutManager setConstraintView:imageView toSuperView:self.view WithPadding:UIEdgeInsetsMake(64, 0, 0, 0)] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
