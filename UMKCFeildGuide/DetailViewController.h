//
//  DetailViewController.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class DSItem;

@interface DetailViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>{
    IBOutlet MKMapView *locationView;
    IBOutlet UILabel* name, *building, *floor, *room;
    
    DSItem* item;

}
@property (nonatomic, strong) DSItem* item;


@end
