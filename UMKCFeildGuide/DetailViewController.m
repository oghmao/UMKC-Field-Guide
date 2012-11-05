//
//  DetailViewController.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "DetailViewController.h"
#import "DSItem.h"
#import "DSMapPoint.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(item.latitude, item.longitude);
    DSMapPoint* point = [[DSMapPoint alloc] initWithCoordinate:coord title:[item name]];
    
    [locationView addAnnotation:point];
    //MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 500, 500);
    //[locationView setRegion:region animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
