//
//  ContactsViewController.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "ContactsViewController.h"
#import "SWRevealViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ContactsViewController() <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationCoordinate2D restOneCoordinates;
@property (nonatomic) CLLocationCoordinate2D restTwoCoordinates;

@end

@implementation ContactsViewController

- (void) viewDidLoad {
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ){
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    //не заубудь выставить делегата для мапВью
    self.mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    //здесь мы добавляем кастомную координату на карту (устанавливаем на нее маркер )
    _restOneCoordinates = CLLocationCoordinate2DMake(47.650323, -122.349433);
    MKPointAnnotation *annotationOne = [[MKPointAnnotation alloc] init];
    [annotationOne setCoordinate:_restOneCoordinates];
    [annotationOne setTitle:@"Restaurant"];
    [annotationOne setSubtitle:@"First"];
    [self.mapView addAnnotation:annotationOne];
    //здесь мы добавляем кастомную координату на карту (устанавливаем на нее маркер )
    _restTwoCoordinates = CLLocationCoordinate2DMake(47.650529, -122.350785);
    MKPointAnnotation *annotationTwo = [[MKPointAnnotation alloc] init];
    [annotationTwo setCoordinate:_restTwoCoordinates];
    [annotationTwo setTitle:@"Restaurant"];
    [annotationTwo setSubtitle:@"Second"];
    [self.mapView addAnnotation:annotationTwo];
    
}

- (IBAction)addressOneButton:(UIButton *)sender {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_restOneCoordinates, 200, 200);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (IBAction)addressTwoButton:(UIButton *)sender {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_restTwoCoordinates, 200, 200);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (IBAction)currentLocationButton:(UIButton *)sender {
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    CLLocationCoordinate2D userCoordinate = [[locationManager location] coordinate];;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userCoordinate, 200, 200);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

@end
