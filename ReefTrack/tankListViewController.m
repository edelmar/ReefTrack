//
//  tankListViewController.m
//  ReefTrack
//
//  Created by Studio Symposium on 4/16/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import "tankListViewController.h"
#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>
#import "getData.h"

@interface tankListViewController ()

@end

@implementation tankListViewController



@class getData;

/*+ (NSString *)parseClassName
{
    return @"SavedTanks";
}*/


- (void)viewDidLoad
{
//    NSArray *savedTankStuff = [getData savedTankArray];
    
    UIImageView *bannerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    [bannerImage setImage:[UIImage imageNamed:@"tankDummyShot.jpg"]];
    [bannerImage setContentMode:UIViewContentModeScaleAspectFill];
    
//    self.tankList = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, 320, 1000) style:UITableViewStylePlain];
    self.tankList.dataSource = self;
    self.tankList.delegate = self;
    self.title = @"My Tanks";

    
    [self.view addSubview:bannerImage];

    [self.view addSubview:self.tankList];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [getData getSavedTanks:^(NSArray *results) {
        self.array = results;
        
        NSLog(@"%@", results);
        [self.tankList reloadData];
    }];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *pfObject = self.array[indexPath.row];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    _tankList = [self.array objectAtIndex:indexPath.row];
    
//    [_lastImage setImage:[UIImage imageNamed:@"AussieTorch.jpg"]];

    cell.textLabel.text = [pfObject valueForKey:@"tankName"];
    cell.detailTextLabel.text = [pfObject valueForKey:@"tankCapacity"];
    cell.imageView.image = [UIImage imageNamed:@"AussieTorch.jpg"];
    
    return cell;
}

// do the normal table view stuff
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"COUNT ROWS IN SECTION: %lu", self.array.count);
    return self.array.count;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //Tank Name
    //Tank Capacity
    //Tank Image (maybe!)

    return self;
}

- (IBAction)addNewTank:(id)sender
{
        [self performSegueWithIdentifier:@"newTankEntry" sender:self];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing


- (void)didReceiveMemoryWarning
{
    [self didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
