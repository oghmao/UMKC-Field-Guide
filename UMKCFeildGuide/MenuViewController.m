//
//  MenuViewController.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "MenuViewController.h"
#import "DetailViewController.h"
#import "ItemViewController.h"
#import "DSItemStore.h"
#import "SettingsViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self navigationController] setTitle:@"Home"];
        [[self navigationController] setNavigationBarHidden:YES animated:NO];
        [[self navigationController] setNavigationBarHidden:YES animated:NO];
        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UMKC-02.png"]];
        
        [[self view] addSubview:backgroundImage];
        [[self view] sendSubviewToBack:backgroundImage];
        
        for (int i = 0; i < 25; ++i) {
            [[DSItemStore sharedStore] createItem];
        }
        
        userLocationManager = [[CLLocationManager alloc] init];
        [userLocationManager setDelegate:self];
        [userLocationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [userLocationManager startUpdatingLocation];

    

}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [userLocationManager stopUpdatingLocation];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)didSelectCategory:(id)sender{
    ItemViewController* ivc = [[ItemViewController alloc] init];
    ivc.tableList = [[DSItemStore sharedStore]allItems];
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}

-(IBAction)didSelectSettings:(id)sender{
    SettingsViewController* svc = [[SettingsViewController alloc] init];
    
    [svc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:svc animated:YES];
}

@end
