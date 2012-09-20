//
//  DSMapPoint.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/20/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface DSMapPoint : NSObject <MKAnnotation>{
    
}
-(id) initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;

@end
