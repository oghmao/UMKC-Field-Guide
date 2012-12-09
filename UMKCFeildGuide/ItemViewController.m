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
@synthesize tableList, type;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        userLocationManager = [[CLLocationManager alloc] init];
        [userLocationManager setDelegate:self];
        [userLocationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        tableList = [[NSArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.view.backgroundColor = [UIColor colorWithRed:0.1412 green:.6706 blue:.8902 alpha:1.0];
//    [userLocationManager startUpdatingLocation];
//    for (int i = 0; i < [[DSItemStore sharedStore] allItems].count; ++i) {
//        DSItem* p = [[[DSItemStore sharedStore] allItems] objectAtIndex:i];
//        CLLocation* currentLoc = userLocationManager.location;
//        CLLocation* cellLocation = [[CLLocation alloc] initWithLatitude:p.latitude longitude:p.longitude];
//        CLLocationDistance distance = [currentLoc distanceFromLocation:cellLocation];
//        p.distance = distance;
//    }
//    
//    [userLocationManager startUpdatingLocation];
//    
//    tableList = [[DSItemStore sharedStore] allItems];
//    
//    [tableList sortedArrayUsingComparator: ^(id a, id b){
//                if ([a distance] > [b distance]) {
//                        return (NSComparisonResult)NSOrderedDescending;
//                    }
//        
//                if ([a distance] < [a distance]) {
//                        return (NSComparisonResult)NSOrderedAscending;
//                    }
//                return (NSComparisonResult)NSOrderedSame;
//            }];
//    
//    [userLocationManager stopUpdatingLocation];
    [userLocationManager startUpdatingLocation];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [userLocationManager startUpdatingLocation];
    
    
    //tableList = [[DSItemStore sharedStore] allItems];
    CLLocation* currentLoc = userLocationManager.location;
    CLLocationDistance distance;

    for (int i = 0; i < tableList.count; ++i) {
        CLLocation* cellLocation = [[CLLocation alloc] initWithLatitude:[[tableList objectAtIndex:i] latitude] longitude:[[tableList objectAtIndex:i] longitude]];
        distance = [currentLoc distanceFromLocation:cellLocation];
        [[tableList objectAtIndex:i] setDistance: distance];
        NSLog(@"lat:%f, lon:%f", [[tableList objectAtIndex:i] latitude], [[tableList objectAtIndex:i] longitude]);
    }
    
    NSArray* sortedArray = [tableList sortedArrayUsingComparator: ^(id a, id b){
        if ([a distance] > [b distance]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([a distance] < [a distance]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    [userLocationManager stopUpdatingLocation];
    
    tableList = sortedArray;
}


- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [tableList count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    

    DSItem* p = [tableList objectAtIndex:[indexPath row]];
  
    
    [[cell textLabel] setText:[p name]];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%0.1f m room: %@", p.distance/1000, [p roomName]]];
    
    [[cell textLabel] setText:[p name]];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%0.1f m room: %@", p.distance/1000, [p roomName]]];
    

    
    return cell;
}

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];

    if (t < -180) {
        return;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES
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


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    DSItem* i = [tableList objectAtIndex:[indexPath row]];
    
    [detailViewController setItem: i];
    [detailViewController setTitle:[i name]];

     // Pass the selected object to the new view controller.
     [[self navigationController] pushViewController:detailViewController animated:YES];
     
}

-(void) dealloc{
    [userLocationManager stopUpdatingLocation];
    [userLocationManager setDelegate:nil];
    tableList = nil;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES
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

@end
