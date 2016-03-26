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
    CLLocationManager *locationManager ;
    CLLocationCoordinate2D userCoordinates ;
    UITableView *tableview ;
    NSArray *flickrPhotos ;
}

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
    [self fetchDataWithService:FlickrServicesTaggedParty];
}

#pragma mark - Service Call
- (void) fetchDataWithService:(FlickrServices) service {
    [self showLoadingIndicator] ;
    
    switch (service) {
        case FlickrServicesTaggedParty: {
            [FlickrClient searchForPhotoWithTag:@"party" :^(NSArray *photos, NSError *error) {
                [self hideLoadingIndicator] ;
                if (!error) {
                    flickrPhotos = photos ;
                    [self reloadTableViewOnMainThread] ;
                }
            }];
        }
            break;

        case FlickrServicesNearstToUserLocation: {
            [FlickrClient photosForLocation:userCoordinates :^(NSArray *photos, NSError *error) {
                [self hideLoadingIndicator] ;
                if (!error) {
                    flickrPhotos = photos ;
                    [self reloadTableViewOnMainThread] ;
                }
            }];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UI Handling
-(void) initUI {
    [self setTableViewConfiguration] ;
    [self addLocationBarItem] ;
    [self addPartyBarItem] ;
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
    tableview = [UIBuilder getConfiguredTableViewToFillParent:self.view];
    [tableview registerClass:[CustomTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    tableview.delegate = self;
    tableview.dataSource = self ;
}

- (void)cleanTableViewItems {
    flickrPhotos = [[NSArray alloc] init] ;
    [self reloadTableViewOnMainThread] ;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return flickrPhotos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    [cell setupCellWithData:[flickrPhotos objectAtIndex:indexPath.row]] ;
    
    return cell;
}

-(void) reloadTableViewOnMainThread {
    dispatch_async(dispatch_get_main_queue(), ^{
        [tableview reloadData] ;
    });
}

#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoDetailsViewController *detailsViewController = [[PhotoDetailsViewController alloc] init] ;
    detailsViewController.photo = [flickrPhotos objectAtIndex:indexPath.row] ;
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

#pragma mark - UserLocation
- (void)configureUserLocation {
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;

    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
}

// Wait for location callbacks
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (locations != nil && locations.count > 0) {
        CLLocation *location = [locations lastObject] ;
        userCoordinates = location.coordinate ;
        [locationManager stopUpdatingLocation] ;
        [self fetchDataWithService:FlickrServicesNearstToUserLocation];
    }
}

#pragma mark - Actions 
- (void)actionParty {
    [locationManager stopUpdatingLocation] ;
    [self cleanTableViewItems];
    [self fetchDataWithService:FlickrServicesTaggedParty];
}

-(void) actionLocation {
    [self showLoadingIndicator];
    [self cleanTableViewItems];
    
    // when find location will update screen
    [self configureUserLocation] ;
}

#pragma mark - Memory Warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
