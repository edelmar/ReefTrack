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
    
    _savedTanksQuery = [PFQuery queryWithClassName:@"SavedTanks"];
    
    PFLogInViewController *loginView = [[PFLogInViewController alloc] init];
    
    loginView.delegate = self;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([PFUser currentUser])
    {
        [self performSegueWithIdentifier:@"loggedIn" sender:self];
    }
    else
    {
        PFLogInViewController *loginView = [[PFLogInViewController alloc] init];
        loginView.delegate = self;
        [self presentViewController:loginView animated:NO completion:nil];
    }
    

    
    // Do any additional setup after loading the view.
}

/* TODO List 4/16/14
 
 - Create User Object
    - Username
    - ObjectID
    - Tank List
 
 - Create Tank Objects
 - Associate Tank Objects with User Objects.........
 
*/

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"loggedIn" sender:self];

    NSLog(@"USERNAME: %@", [PFUser currentUser]);
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
