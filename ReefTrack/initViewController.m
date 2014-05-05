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
    if ([PFUser currentUser])
    {
        [self performSegueWithIdentifier:@"yesTanks" sender:self];
    }
    self.title = @"Reef Track";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*- (IBAction)loginButton:(id)sender
{
    PFLogInViewController *loginView = [[PFLogInViewController alloc] init];
    loginView.delegate = self;
    
    loginView.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hermitShot.jpg"]];
    
    [self presentViewController:loginView animated:NO completion:nil];

}*/

- (IBAction)buttonPressed:(id)sender
{
    PFSignUpViewController *signupView = [[PFSignUpViewController alloc] init];
    switch (_button.tag)
    {
        case 0:
            if (_passwordField.text != nil && _loginField.text != nil)
            {
                NSLog(@"USERNAME ENTERED? %@", _loginField.text);
                NSLog(@"PASSWORD ENTERED? %@", _passwordField.text);
                         [PFUser logInWithUsername:_loginField.text password:_passwordField.text];
            }
            else
            {
                UIAlertView *fillInAlert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Please Enter Usename and Password" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
                [fillInAlert show];
            }
            break;
        case 1:
            [self presentViewController:signupView animated:YES completion:nil];
            break;
            case 2:
            NSLog(@"USER DOESNT REMEMBER WHAT A JERK!");
            break;
        default:
            break;
    }
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
