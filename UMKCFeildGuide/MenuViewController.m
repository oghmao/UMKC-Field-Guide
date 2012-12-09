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
#import "DSItem.h"

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
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
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

-(IBAction)didSelectCategoryFacilities:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"Restrooms"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}
-(IBAction)didSelectCategoryBldg:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"Bldg"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}
-(IBAction)didSelectCategoryFood:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"Food"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}
-(IBAction)didSelectCategoryLabs:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"Labs"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}
-(IBAction)didSelectCategoryStudying:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"Lounge"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}
-(IBAction)didSelectCategoryServices:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"Services"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}
-(IBAction)didSelectCategoryADA:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"ADA"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}
-(IBAction)didSelectCategoryParking:(id)sender{
    
    NSMutableArray* tempList = [[NSMutableArray alloc]init];
    
    ItemViewController* ivc = [[ItemViewController alloc] init];
    for (int i = 0; i < [[DSItemStore sharedStore]allItems].count; i++) {
        DSItem* temp = [[[DSItemStore sharedStore]allItems]objectAtIndex:i];
        if ([temp.typeString isEqualToString:@"Parking"]) {
            [tempList addObject:[[[DSItemStore sharedStore]allItems]objectAtIndex:i]];
        }
    }
    ivc.tableList = tempList;
    
    
    [ivc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}

-(IBAction)didSelectSettings:(id)sender{
    SettingsViewController* svc = [[SettingsViewController alloc] init];
    
    [svc setTitle:[[sender titleLabel] text]];
    
    [[self navigationController] pushViewController:svc animated:YES];
}

@end
