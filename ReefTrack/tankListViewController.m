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
#import "TankViewController.h"

@interface tankListViewController ()
@end
@implementation tankListViewController
@class getData;

- (void)viewDidLoad
{
    
    [[UITableViewCell appearance] setBackgroundColor:[UIColor clearColor]];

    [[UITableView appearance] setBackgroundColor:[UIColor clearColor]];
    
    [getData getSavedTanks:^(NSArray *results) {
        self.array = results;
        NSLog(@"TANK LIST SELECTOR DEBUG: %@", self.tankList);
        [self.tankList reloadData];
        NSLog(@"%@", results);
    }];
    
    self.tankList.dataSource = self;
    self.tankList.delegate = self;
    self.title = @"My Tanks";
    
    [self.view addSubview:self.tankList];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

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
    
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    cell.textLabel.text = [pfObject valueForKey:@"tankName"];
    cell.detailTextLabel.text = [pfObject valueForKey:@"tankCapacity"];
//    cell.imageView.image = [UIImage imageNamed:@"AussieTorch.jpg"];
    
    return cell;
}

// do the normal table view stuff
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (IBAction)addNewTank:(id)sender
{
    [self performSegueWithIdentifier:@"newTankEntry" sender:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSInteger *row = [indexPath row];
    
    NSArray *array = [_array objectAtIndex:indexPath.row];
    NSString *objectId = [array valueForKey:@"objectId"];
    NSLog(@"Row Tapped: %@", objectId);
    [self performSegueWithIdentifier:@"selectTank" sender:objectId];
    // WHEN A CELL IS SELECTED GO HERE!
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing


- (void)didReceiveMemoryWarning
{
    [self didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"selectTank"])
    {
        TankViewController *controller = (TankViewController *)segue.destinationViewController;
        
        controller.passedValue = sender;
        
        NSLog(@"PASSED VALUE: %@", controller.passedValue);
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
