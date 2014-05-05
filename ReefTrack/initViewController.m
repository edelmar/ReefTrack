//
//  initViewController.m
//  ReefTrack
//
//  Created by Studio Symposium on 4/16/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//



#import "initViewController.h"
#import "SurveyViewController.h"
#import <Parse/Parse.h>
#import "getData.h"
#import "QuartzCore/QuartzCore.h"
#import "MBProgressHUD.h"


@class getData;

@interface initViewController ()

@end

@implementation initViewController

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
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    
    self.title = @"Reef Track";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [PFUser logOut];
    NSLog(@"User Logout Test: %@", [PFUser currentUser]);
}

- (IBAction)dismissKeyboard:(id)sender
{
    [self resignFirstResponder];
}

- (IBAction)buttonPressed:(UIButton *)sender
{
        [self.view addSubview:HUD];
    PFSignUpViewController *signupView = [[PFSignUpViewController alloc] init];
    switch (sender.tag)
    {
        case 0:
        {
            if (_passwordField.text != nil && _loginField.text != nil)
            {
                NSString *loginString = _loginField.text;
                NSString *pwString = _passwordField.text;
                
                [PFUser logInWithUsernameInBackground:loginString password:pwString block:^(PFUser *user, NSError *error) {
                    if (user)
                    {
                        [self performSelector:@selector(logInViewController:didLogInUser:) withObject:nil];
                    }
                    else
                    {
                        UIAlertView *loginFailAlert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Invalid Login Credentials" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
                        [loginFailAlert show];
                    }
                }];
                [self performSelector:@selector(logInViewController:didLogInUser:) withObject:nil];
            }
            else
            {
                UIAlertView *fillInAlert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Please Enter Usename and Password" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
                [fillInAlert show];
            }
            break;
        }
        case 1:
        {
            [self presentViewController:signupView animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}

- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
{

}


- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    if ([PFUser currentUser])
    {
        [getData getSavedTanks:^(NSArray *results)
         {
             self.array = results;
             
             if (results != nil)
             {
                 [self performSegueWithIdentifier:@"yesTanks" sender:self];
             }
             else
             {
                 [self performSegueWithIdentifier:@"noTanks" sender:self];
             }
         }];
    }
    [self dismissViewControllerAnimated:YES completion:nil];

    NSLog(@"USERNAME: %@", [PFUser currentUser]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
