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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loginButton:(id)sender
{
    PFLogInViewController *loginView = [[PFLogInViewController alloc] init];
    loginView.delegate = self;
    [self presentViewController:loginView animated:NO completion:nil];

}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    if ([PFUser currentUser])
    {
//        [self performSegueWithIdentifier:@"loggedIn" sender:self];
        /*
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
         */
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
