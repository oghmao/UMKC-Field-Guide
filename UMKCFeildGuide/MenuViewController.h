//
//  MenuViewController.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <CoreLocation/CoreLocation.h>

@interface MenuViewController : UIViewController <CLLocationManagerDelegate>{
    CLLocationManager* userLocationManager;
}

-(IBAction)didSelectCategory:(id)sender;
-(IBAction)didSelectSettings:(id)sender;
@end
