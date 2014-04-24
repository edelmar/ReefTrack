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

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addLightsButton:(id)sender
{
    UIAlertView *addLightsAlert = [[UIAlertView alloc] initWithTitle:@"ADD LIGHTS HERE" message:@"This is where you add lights" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [addLightsAlert show];
}

- (IBAction)addFilterButton:(id)sender
{
    UIAlertView *addFilterAlert = [[UIAlertView alloc] initWithTitle:@"ADD FILTER HERE" message:@"This is where you add Filtration" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [addFilterAlert show];
}

- (IBAction)addMovementButton:(id)sender
{
    UIAlertView *addMovementAlert = [[UIAlertView alloc] initWithTitle:@"ADD MOVEMENT HERE" message:@"This is where you add water movement" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [addMovementAlert show];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [PFUser logOut];
    NSLog(@"USERNAME: %@", _user);
}

- (IBAction)textFieldReturn:(id)sender
{
    
    PFUser *user = [PFUser currentUser];
    NSString *userNameString = [user objectForKey:@"username"];
    
    NSLog(@"USER NAME STRING: %@", userNameString);
    

    
    NSLog(@"SAVING TANK NAME AS: %@", _tankName.text);
    NSLog(@"SAVING TANK CAPACITY AS: %@", _tankCapacity.text);
    [_savedTank setObject:userNameString forKey:@"userName"];
    [_savedTank setObject:_tankName.text forKey:@"tankName"];
    [_savedTank setObject:_tankCapacity.text forKey:@"tankCapacity"];
    

    
//    [_savedTank saveInBackgroundWithTarget:self selector:@selector(saveButton:)];

    [sender resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

- (IBAction)saveButton:(id)sender
{
    NSLog(@"OBJECT ID: %@", _savedTank.objectId);
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
