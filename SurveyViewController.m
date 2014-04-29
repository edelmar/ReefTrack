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
 *      TableView Background
 *      ADD MORE THAN ONE ITEM TO ARRAY!!!!
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
    
    UIImageView *bannerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    [bannerImage setImage:[UIImage imageNamed:@"tankDummyShot.jpg"]];
    [bannerImage setContentMode:UIViewContentModeScaleAspectFill];
    
    _tankFiltration.tag = 0;
    _tankFiltration.dataSource = self;
    _tankFiltration.delegate = self;
    
    _tankLights.tag = 1;
    _tankLights.dataSource = self;
    _tankLights.delegate = self;
    
    _tankMovement.tag = 2;
    _tankMovement.dataSource = self;
    _tankMovement.delegate = self;
    
    [self.view addSubview:bannerImage];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _tankLightsArray = [[NSMutableArray alloc] init];
    _tankFilterArray = [[NSMutableArray alloc] init];
    _tankMovementArray = [[NSMutableArray alloc] init];
    
    NSString *newLightsString = [[NSString alloc] init];
    NSString *newFiltrationString = [[NSString alloc] init];
    NSString *newMovementString = [[NSString alloc] init];
    
    NSString *titleString = [alertView buttonTitleAtIndex:buttonIndex];
    
    switch (alertView.tag)
    {
        case 0:
            
            if ([titleString isEqualToString:@"Add"])
            {
                newLightsString = [alertView textFieldAtIndex:0].text;
                [_tankLightsArray addObject:newLightsString];
                NSLog(@"I THINK IT WORKED! %lu", _tankLightsArray.count);
            }
            
/*
            NSLog(@"New Lighting Added: %@", newLightsString);
            [_tankLightsArray addObject:newLightsString];
            NSLog(@"Number of Lights Added: %lu", _tankLightsArray.count);
            //            [_tankLights reloadData];*/
            break;
        case 1:
            newFiltrationString = [alertView textFieldAtIndex:0].text;
            [_tankFilterArray addObject:newFiltrationString];
            NSLog(@"Number of Filtration Parts Added: %lu", _tankFilterArray.count);
            NSLog(@"New Filtration Added: %@", newFiltrationString);
            //            [_tankFiltration reloadData];
            break;
        case 2:
            newMovementString = [alertView textFieldAtIndex:0].text;
            [_tankMovementArray addObject:newMovementString];
            NSLog(@"Number of Filtration Parts Added: %lu", _tankMovementArray.count);
            NSLog(@"New Movement Added: %@", newMovementString);
            //            [_tankMovement reloadData];
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
    
    NSLog(@"Tank Movement Array Items: %lu", _tankMovementArray.count);
    NSLog(@"Tank Lights Array Items: %lu", _tankLightsArray.count);
    NSLog(@"Tank Filtration Array Items: %lu", _tankFilterArray.count);
    
    return _tankMovementArray.count;
    return _tankLightsArray.count;
    return _tankFilterArray.count;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return self;
}

- (IBAction)addLightsButton:(id)sender
{
    UIAlertView *addLightsAlert = [[UIAlertView alloc] initWithTitle:@"Add Light Fixture" message:nil delegate:self cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles:@"Add", nil];
    
    addLightsAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    addLightsAlert.tag = 0;
    
    [addLightsAlert show];
}

- (IBAction)addFilterButton:(id)sender
{
    UIAlertView *addFilterAlert = [[UIAlertView alloc] initWithTitle:@"Add Filtration Element" message:nil delegate:self cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles:@"Add", nil];
    
    addFilterAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    addFilterAlert.tag = 1;
    
    [addFilterAlert show];
}

- (IBAction)addMovementButton:(id)sender
{
    UIAlertView *addMovementAlert = [[UIAlertView alloc] initWithTitle:@"Add Water Movement" message:nil delegate:self cancelButtonTitle:@"Cancel"
                                                     otherButtonTitles:@"Add", nil];
    
    addMovementAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    addMovementAlert.tag = 2;
    
    [addMovementAlert show];
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




- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

- (IBAction)saveButton:(id)sender
{
    /**
     *  LEAVE THIS ALONE
     */
    
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
