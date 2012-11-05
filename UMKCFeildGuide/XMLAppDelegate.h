//
//  XMLAppDelegate.h
//  UMKCFeildGuide
//
//  Created by David Scott on 11/4/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLAppDelegate : NSObject <UIApplicationDelegate>{
    
    UIWindow *window;
    UINavigationController *navigationController;
    
    NSMutableArray *items;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) NSMutableArray *items;

@end
