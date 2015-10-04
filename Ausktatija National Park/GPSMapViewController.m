//
//  GPSMapViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 01/10/2015.
//  Copyright © 2015 anand. All rights reserved.
//

#import "GPSMapViewController.h"

@interface GPSMapViewController ()




@end

@implementation GPSMapViewController

@synthesize coordinate;



- (void)viewDidLoad {
    [super viewDidLoad];
    
   [self startCoreLocation];
   [self drawNationalParkArea];
    
    
    
    
    
    
}



-(void)viewDidDisappear:(BOOL)animated{
    
    
    [self.locationManager stopUpdatingHeading];
    [self.locationManager stopUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark draw national park area

-(void)drawNationalParkArea
{
    
    // lower-left co-ordinate of national park
    CLLocationCoordinate2D lowerLeftCoOrd = CLLocationCoordinate2DMake(55.211601, 25.794129);
    
    // create a map-point using lower-left co-ordinate.
    MKMapPoint lowerLeft = MKMapPointForCoordinate(lowerLeftCoOrd);
    
    // upper-right co-ordinate of USA Map
    CLLocationCoordinate2D upperRightCoOrd = CLLocationCoordinate2DMake(55.517075, 26.191882);
    
    // create a map-point using upper-right co-ordinate
    MKMapPoint upperRight = MKMapPointForCoordinate(upperRightCoOrd);
    
    // create a map-rect using both co-ordinates as follows.
    MKMapRect mapRect = MKMapRectMake(lowerLeft.x, upperRight.y, upperRight.x - lowerLeft.x, lowerLeft.y - upperRight.y);
    
    self.mapRect = mapRect;
    
    // set zoom to rect &amp; you are done.
    [self.mapView setVisibleMapRect:mapRect animated:YES];
    
    
}


#pragma mark Corelocation Start

-(void)startCoreLocation {
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    if ([CLLocationManager locationServicesEnabled])
        
    {
        
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
            
        {
            
            [self.locationManager requestWhenInUseAuthorization];
            
            self.locationManager.delegate = self;
            self.locationManager.desiredAccuracy =
            kCLLocationAccuracyBest;
            
            [self.locationManager startUpdatingLocation];
            
         self.mapView.showsUserLocation = YES;
            
        }
        
    }}

//LOCATION MANAGER
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations

{
 
    
         
    CLLocation* loc = [locations lastObject]; // locations is guaranteed to have at least one object
    float latitude = loc.coordinate.latitude;
    float longitude = loc.coordinate.longitude;
    NSLog(@"%.8f",latitude);
    NSLog(@"%.8f",longitude);
    
    
    CLLocationCoordinate2D userlocation = self.mapView.userLocation.location.coordinate;
    MKMapPoint userPoint = MKMapPointForCoordinate(userlocation);
    BOOL inside = MKMapRectContainsPoint(self.mapRect, userPoint);
    
    
    
    NSLog(@"%f",userlocation.latitude);
    
    NSLog(@"Inside the park ? : %@", (inside) ? @"YES"  : @"NO");
    
    if (inside == YES) {
        
        self.mapView.showsUserLocation = YES;
        
        [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
        
        self.notInBoundaryAlertLabel.text = @"";
        
        
        
    } else if (inside == NO) {
        
        
        self.notInBoundaryAlertLabel.text = @"You are not in National Park Boundary";
        
        
    }

         
     }


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if (userLocation.location == nil)
        return;
    
    //do something with userLocation...
}



- (IBAction)myCurrentLocation:(id)sender {
   

    //if user is within the location of the national park show the user location if not give uialertview stating that the person is out of national park range. please try again from the park region.

    CLLocationCoordinate2D userlocation = self.mapView.userLocation.location.coordinate;
    

    MKMapPoint userPoint = MKMapPointForCoordinate(userlocation);
    
    
    BOOL inside = MKMapRectContainsPoint(self.mapRect, userPoint);
    

    
    NSLog(@"Inside the park ? : %@", (inside) ? @"YES"  : @"NO");
    
    if (inside == YES) {
        
        self.mapView.showsUserLocation = YES;
    
       [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
        
        self.notInBoundaryAlertLabel.text = @"";
        


    } else if (inside == NO) {
        
        
        self.notInBoundaryAlertLabel.text = @"You are not in National Park Boundary";
        
   
        }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [self.mapView setShowsUserLocation:YES];
    
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
