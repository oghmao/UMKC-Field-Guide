//
//  ItemViewController.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ItemViewController : UITableViewController <CLLocationManagerDelegate>{
    NSString* name;
    CLLocationManager* userLocationManager;
    NSArray* tableList;
    NSString* type;
}

@property (nonatomic, copy) NSArray* tableList;
@property (nonatomic, copy) NSString* type;

@end
