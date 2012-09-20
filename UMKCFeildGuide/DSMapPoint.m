//
//  DSMapPoint.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/20/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "DSMapPoint.h"

@implementation DSMapPoint

@synthesize coordinate, title;

-(id)init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t{
    self = [super init];
    
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}

@end
