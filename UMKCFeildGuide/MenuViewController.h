//
//  MenuViewController.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MenuViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>{
    CLLocationManager* userLocationManager;
    IBOutlet MKMapView* mapview;    
}

-(IBAction)didSelectCategoryBldg:(id)sender;
-(IBAction)didSelectCategoryFood:(id)sender;
-(IBAction)didSelectCategoryLabs:(id)sender;
-(IBAction)didSelectCategoryFacilities:(id)sender;
-(IBAction)didSelectCategoryStudying:(id)sender;
-(IBAction)didSelectCategoryServices:(id)sender;
-(IBAction)didSelectCategoryADA:(id)sender;
-(IBAction)didSelectCategoryParking:(id)sender;
-(IBAction)didSelectSettings:(id)sender;
@end
