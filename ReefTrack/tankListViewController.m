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
#import "initViewController.h"
#import "SurveyViewController.h"

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
    UIImageView *bannerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    [bannerImage setImage:[UIImage imageNamed:@"tankDummyShot.jpg"]];
    [bannerImage setContentMode:UIViewContentModeScaleAspectFill];
    
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
        NSLog(@"TANK LIST SELECTOR DEBUG: %@", self.tankList);
        [self.tankList reloadData];
        NSLog(@"%@", results);
    }];
}

-(void)setTankList:(id)val
{
    _tankList = val;
    NSLog(@"%@", val);
    
}

- (void)viewDidDisappear:(BOOL)animated
{
//    [PFUser logOut];
//    [self dismissViewControllerAnimated:YES completion: nil];
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

    [self performSegueWithIdentifier:@"newTankEntry" sender:nil];
    
    
//        [self performSegueWithIdentifier:@"newTankEntry" sender:self];
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
