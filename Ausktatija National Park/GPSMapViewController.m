//
//  GPSMapViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 01/10/2015.
//  Copyright © 2015 anand. All rights reserved.
//

#import "GPSMapViewController.h"

@interface GPSMapViewController ()


@property (nonatomic, strong) CLLocation *selectedLocation;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, assign) CLLocationDistance distance;

@property (nonatomic, assign) CLLocationCoordinate2D topLeftCoordinate;
@property (nonatomic, assign) CLLocationCoordinate2D bottomRightCoordinate;



@end

@implementation GPSMapViewController

@synthesize coordinate;
@synthesize topLeftCoordinate, bottomRightCoordinate;



- (void)viewDidLoad {
    [super viewDidLoad];
    
   [self startCoreLocation];

    
    CLLocationCoordinate2D ireland = CLLocationCoordinate2DMake(55.510710, 25.817404);
 
    [self.mapView setRegion: MKCoordinateRegionMakeWithDistance(ireland, 9000, 6000)];
    [self.mapView setMapType: MKMapTypeStandard];
    
    

}

-(void)viewDidDisappear:(BOOL)animated{
    
    
    [self.locationManager stopUpdatingHeading];
    [self.locationManager stopUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            
        
            
        }
        
    }}

//LOCATION MANAGER
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations

{
    
    
}


#pragma mark Limit Mapscroll to designated fixed area of the national park

-(void)mapView:(MKMapView *)mapview regionWillChangeAnimated:(BOOL)animated
{
    
    
    
    
    
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
