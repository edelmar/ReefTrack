//
//  initViewController.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/16/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"

@interface initViewController : UIViewController <UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITextFieldDelegate, UIActivityItemSource>

{
    MBProgressHUD *HUD;
}



@property (nonatomic, strong) PFQuery *savedTanksQuery;
@property (nonatomic, strong) PFQuery *tankNameQuery;
@property (nonatomic, strong) PFQuery *tankCapacityQuery;
@property (strong, nonatomic) NSArray *array;
@property (nonatomic, strong) PFUser *user;

@property (nonatomic, strong) IBOutlet UITextField *loginField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;

@property (nonatomic, retain) IBOutlet UIButton *button;



@end
