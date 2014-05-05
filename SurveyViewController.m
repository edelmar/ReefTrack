//
//  SurveyViewController.m
//  ReefTrack
//
//  Created by Studio Symposium on 4/15/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import "SurveyViewController.h"
#import <Parse/Parse.h>

@interface SurveyViewController ()


@end
/**
 *  KNOWN BUGS
 *      Reload Data
 */
@implementation SurveyViewController

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
    self.title = @"New Tank";
    
    [[UITableViewCell appearance] setBackgroundColor:[UIColor clearColor]];
    [[UITableViewCell appearance] setIndentationLevel:-20.0f];

    [[UITableView appearance] setBackgroundColor:[UIColor clearColor]];

    _LightsString = [[NSString alloc] init];
    _FiltrationString = [[NSString alloc] init];
    _MovementString = [[NSString alloc] init];
    
    _tankLightsArray = [[NSMutableArray alloc]init];
    _tankFilterArray = [[NSMutableArray alloc] init];
    _tankMovementArray = [[NSMutableArray alloc] init];
    
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (alertView.tag)
    {
        case 0:
            _FiltrationString = [alertView textFieldAtIndex:0].text;
            [_tankFilterArray addObject:_FiltrationString];
            NSLog(@"Number of Filtration Parts Added: %lu", (unsigned long)_tankFilterArray.count);
            [self.tankFiltration reloadData];
            break;
        case 1:
            _LightsString = [alertView textFieldAtIndex:0].text;
            [_tankLightsArray addObject:_LightsString];
            NSLog(@"Number of Lights Added: %lu", (unsigned long)_tankLightsArray.count);
            [self.tankLights reloadData];
            break;
        case 2:
            _MovementString = [alertView textFieldAtIndex:0].text;
            [_tankMovementArray addObject:_MovementString];
            NSLog(@"Number of Water Movement Added: %lu", (unsigned long)_tankMovementArray.count);
            [self.tankMovement reloadData];
            break;
        default:
            break;
    }
}


- (void)addEquipment:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 0:
            _inputAlert = [[UIAlertView alloc] initWithTitle:@"Add Filtration Element" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
            _inputAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [_inputAlert show];
            _inputAlert.tag = 0;
            break;
        case 1:
            _inputAlert = [[UIAlertView alloc] initWithTitle:@"Add Lighting" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
            _inputAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [_inputAlert show];
            _inputAlert.tag = 1;
            break;
        case 2:
            _inputAlert = [[UIAlertView alloc] initWithTitle:@"Add Water Movement" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
            _inputAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [_inputAlert show];
            _inputAlert.tag = 2;
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch (tableView.tag)
    {
        case 0:
            _tankFiltration = [_tankFilterArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [_tankFilterArray objectAtIndex:indexPath.row];
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

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"USERNAME: %@", [PFUser currentUser]);
}

- (IBAction)textFieldReturn:(id)sender
{
    PFUser *user = [PFUser currentUser];
    NSString *userNameString = [user objectForKey:@"username"];
    NSLog(@"USER NAME STRING: %@", userNameString);
    NSLog(@"SAVING TANK NAME AS: %@", _tankName.text);
    NSLog(@"SAVING TANK CAPACITY AS: %@", _tankCapacity.text);

    [sender resignFirstResponder];
}

- (IBAction)saveButton:(id)sender
{
    _user = [PFUser currentUser];
    NSString *userNameString = [_user objectForKey:@"username"];
    _savedTank = [PFObject objectWithClassName:@"SavedTanks"];
    [_savedTank setObject:userNameString forKey:@"userName"];
    [_savedTank setObject:_tankName.text forKey:@"tankName"];
    [_savedTank setObject:_tankCapacity.text forKey:@"tankCapacity"];
    [_savedTank setObject:_tankLightsArray forKey:@"tankLights"];
    [_savedTank setObject:_tankFilterArray forKey:@"tankFiltration"];
    [_savedTank setObject:_tankMovementArray forKey:@"tankMovement"];
    
    [_savedTank save];
    [self performSegueWithIdentifier:@"toTankList" sender:nil];
    NSLog(@"OBJECT ID: %@", [_savedTank objectId]);
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
