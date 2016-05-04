//
//  MainViewController.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "MainViewController.h"

static NSString *kCellIdentifier = @"CustomTableViewCell";

@interface MainViewController () {
    CLLocationCoordinate2D userCoordinates ;
    LocationService *locationService;
}

@property (nonatomic, strong) UITableView *tableview ;
@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;
@property (nonatomic, strong) PhotosListViewModel *viewModel;

@end


@implementation MainViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}


#pragma mark - UI Handling
-(void) initUI {
    [self setTableViewConfiguration] ;
    [self addLocationBarItem] ;
    [self addPartyBarItem] ;
    _viewModel = [[PhotosListViewModel alloc] initWithDelegate:self];
}

- (void) addLocationBarItem {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_location"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(actionLocation)] ;
    button.tintColor = [UIColor blackColor] ;
    self.navigationItem.rightBarButtonItem = button ;
}

- (void) addPartyBarItem {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_party"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(actionParty)] ;
    button.tintColor = [UIColor blackColor] ;
    self.navigationItem.leftBarButtonItem = button ;
}

// Set main tableview configurations.
-(void) setTableViewConfiguration {
    self.tableview = [UIBuilder getConfiguredTableViewToFillParent:self.view];
    [self.tableview registerClass:[CustomTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self initTableViewDataSource] ;
    self.tableview.delegate = self;
}

- (void)cleanTableViewItems {
    [self.viewModel cleanPhotosList];
    [self reloadTableViewOnMainThread] ;
}

#pragma mark - Table view data source
- (void) initTableViewDataSource {
    
    TableViewCellConfigureBlock configureCell = ^(CustomTableViewCell *cell, Photo *photo) {
        [cell setupCellWithData:photo] ;
    };
    
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:self.viewModel.photosList
                                                    cellIdentifier:kCellIdentifier
                                                configureCellBlock:configureCell];
    
    self.tableview.dataSource = self.photosArrayDataSource ;
}

-(void) reloadTableViewOnMainThread {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.photosArrayDataSource.items = self.viewModel.photosList ;
        [self.tableview reloadData] ;
    });
}

#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoDetailsViewController *detailsViewController = [[PhotoDetailsViewController alloc] init] ;
    detailsViewController.photo = [self.viewModel.photosList objectAtIndex:indexPath.row] ;
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

#pragma mark - UserLocation
- (void)configureUserLocation {
    __weak __typeof(self)weakSelf = self;
    locationService = [LocationService new];
    [locationService startUpdatingLocation];
    locationService.updateLocation = ^(CLLocationCoordinate2D location, NSString *errorMSG) {
        if (!errorMSG) {
            userCoordinates = location ;
            [weakSelf fetchDataWithService:FlickrServicesNearstToUserLocation];
        }else {
            [ErrorHandling generalErrorWithDescription:errorMSG];
        }
    };
}

#pragma mark - Service Call
- (void) fetchDataWithService:(FlickrServices) service {
    [self showLoadingIndicator] ;
    
    switch (service) {
        case FlickrServicesTaggedParty: {
            [self.viewModel fetchDataPartyPhotosData];
        }
            break;
            
        case FlickrServicesNearstToUserLocation: {
            [self.viewModel fetchDataForLocation:userCoordinates];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Actions 
- (void)actionParty {
    [self cleanTableViewItems];
    [self fetchDataWithService:FlickrServicesTaggedParty];
}

-(void) actionLocation {
    [self cleanTableViewItems];
    [self showLoadingIndicator];
    
    // when find location will update screen
    [self configureUserLocation] ;
}

#pragma mark - Memory Warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateUI {
    [self hideLoadingIndicator];
    [self reloadTableViewOnMainThread];
}
@end
