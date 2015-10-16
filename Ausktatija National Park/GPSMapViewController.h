//
//  GPSMapViewController.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 01/10/2015.
//  Copyright © 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>



@interface GPSMapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, MKAnnotation, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property(nonatomic, retain) CLLocationManager *locationManager;
@property (assign, nonatomic) CLLocationCoordinate2D  userLocation;
@property (assign, nonatomic) MKMapRect mapRect;
@property (assign, nonatomic) MKMapPoint userPoint;


@property (nonatomic, assign) BOOL inside;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (weak, nonatomic) IBOutlet UILabel *notInBoundaryAlertLabel;



-(void)startCoreLocation;


@end
