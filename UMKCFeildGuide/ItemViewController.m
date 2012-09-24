//
//  ItemViewController.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "ItemViewController.h"
#import "DSItem.h"
#import "DSItemStore.h"
#import "DetailViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        userLocationManager = [[CLLocationManager alloc] init];
        [userLocationManager setDelegate:self];
        [userLocationManager setDesiredAccuracy:kCLLocationAccuracyBest];
                
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.view.backgroundColor = [UIColor colorWithRed:0.1412 green:.6706 blue:.8902 alpha:1.0];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section == 0) {
//        int blgdCount = 0;
//        for (int i = 0; i < [[[DSItemStore sharedStore] allItems] count]; ++i) {
//            DSItem* current = [[[DSItemStore sharedStore] allItems] objectAtIndex:i];
//            if (current.bldgName == Flarsheim) {
//                blgdCount++;
//            }
//        }
//        return blgdCount;
//    }else if (section == 1) {
//        int blgdCount = 0;
//        for (int i = 0; i < [[[DSItemStore sharedStore] allItems] count]; ++i) {
//            DSItem* current = [[[DSItemStore sharedStore] allItems] objectAtIndex:i];
//            if (current.bldgName == Haag) {
//                blgdCount++;
//            }
//        }
//        return blgdCount;
//    }else if (section == 2) {
//        int blgdCount = 0;
//        for (int i = 0; i < [[[DSItemStore sharedStore] allItems] count]; ++i) {
//            DSItem* current = [[[DSItemStore sharedStore] allItems] objectAtIndex:i];
//            if (current.bldgName == Royal) {
//                blgdCount++;
//            }
//        }
//        return blgdCount;
//    }else if (section == 3) {
//        int blgdCount = 0;
//        for (int i = 0; i < [[[DSItemStore sharedStore] allItems] count]; ++i) {
//            DSItem* current = [[[DSItemStore sharedStore] allItems] objectAtIndex:i];
//            if (current.bldgName == Katz) {
//                blgdCount++;
//            }
//        }
//        return blgdCount;
//    }else if (section == 4) {
//        int blgdCount = 0;
//        for (int i = 0; i < [[[DSItemStore sharedStore] allItems] count]; ++i) {
//            DSItem* current = [[[DSItemStore sharedStore] allItems] objectAtIndex:i];
//            if (current.bldgName == Scofield) {
//                blgdCount++;
//            }
//        }
//        return blgdCount;
//    }else
//        return 1;
    return [[[DSItemStore sharedStore] allItems] count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    
    [userLocationManager startUpdatingLocation];

    DSItem* p = [[[DSItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    CLLocation* currentLoc = userLocationManager.location;
    CLLocation* cellLocation = [[CLLocation alloc] initWithLatitude:p.latitude longitude:p.longitude];
    CLLocationDistance distance = [currentLoc distanceFromLocation:cellLocation];
    
    [[cell textLabel] setText:[p itemName]];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%@ room: %@", [NSString stringWithFormat:@"%0.1f m", distance/1000], [p roomName]]];
    
    [userLocationManager stopUpdatingLocation];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
     // ...
    DSItem* i = [[[DSItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    
    [detailViewController setItem: i];
    [detailViewController setTitle:[i itemName]];

     // Pass the selected object to the new view controller.
     [[self navigationController] pushViewController:detailViewController animated:YES];
     
}

-(void) dealloc{
    [userLocationManager setDelegate:nil];
}

@end
