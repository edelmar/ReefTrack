//
//  TankViewController.m
//  ReefTrack
//
//  Created by Studio Symposium on 4/15/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import "TankViewController.h"
#import "tankListViewController.h"
#import <Parse/Parse.h>
#import "getData.h"

@class getData;

@interface TankViewController ()

@end

@implementation TankViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [[UITableViewCell appearance] setBackgroundColor:[UIColor clearColor]];
    
    [[UITableView appearance] setBackgroundColor:[UIColor clearColor]];
    
    _tankFiltration.tag = 0;
    _tankFiltration.dataSource = self;
    _tankFiltration.delegate = self;
    
    _tankLights.tag = 1;
    _tankLights.dataSource = self;
    _tankLights.delegate = self;
    
    _tankMovement.tag = 2;
    _tankMovement.dataSource = self;
    _tankMovement.delegate = self;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    PFQuery *tankQuery = [PFQuery queryWithClassName:@"SavedTanks"];
    PFObject *tankObject = [tankQuery getObjectWithId:_passedValue];
    _array = [NSArray arrayWithArray:[tankObject objectForKey:_passedValue]];
    
    NSString *tankCapString = [tankObject valueForKey:@"tankCapacity"];
    NSString *titleString = [tankObject valueForKey:@"tankName"];
    self.title = titleString;
    _tankNameLabel.text = titleString;
    _tankCapacityLabel.text = tankCapString;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"Cell";
    NSString *cellModifier = @"- ";
    NSString *cellText = [[NSString alloc]init];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch (tableView.tag)
    {
        case 0:
            _tankFiltration = [_tankFilterArray objectAtIndex:indexPath.row];
            cellText = [_tankFilterArray objectAtIndex:indexPath.row];
            cell.textLabel.text = cellText;
            break;
        case 1:
            _tankLights = [_tankLightsArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [_tankLightsArray objectAtIndex:indexPath.row];
            break;
        case 2:
            _tankMovement = [_tankMovementArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [_tankMovementArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PFQuery *tankQuery = [PFQuery queryWithClassName:@"SavedTanks"];
    PFObject *tankObject = [tankQuery getObjectWithId:_passedValue];
    _array = [NSArray arrayWithArray:[tankObject objectForKey:_passedValue]];
    _tankFilterArray = [tankObject objectForKey:@"tankFiltration"];
    _tankLightsArray = [tankObject objectForKey:@"tankLights"];
    _tankMovementArray = [tankObject objectForKey:@"tankMovement"];
    
    if (tableView.tag == 0)
    {
        // MAKE FILTRATION TAG HERE
        return _tankFilterArray.count;
    }
    if (tableView.tag == 1)
    {
        // MAKE LIGHTS TAG HERE
        return _tankLightsArray.count;
    }
    if (tableView.tag == 2)
    {
        // MAKE MOVEMENT TAG HERE
        return _tankMovementArray.count;
    }
    
    NSLog(@"Tank Movement Array Items: %lu", (unsigned long)_tankMovementArray.count);
    NSLog(@"Tank Lights Array Items: %lu", (unsigned long)_tankLightsArray.count);
    NSLog(@"Tank Filtration Array Items: %lu", (unsigned long)_tankFilterArray.count);
    
    return _tankMovementArray.count;
    return _tankLightsArray.count;
    return _tankFilterArray.count;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
