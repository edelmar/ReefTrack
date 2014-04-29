//
//  initViewController.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/16/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface initViewController : UIViewController <UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

{
    
}

@property (nonatomic, strong) PFQuery *savedTanksQuery;
@property (nonatomic, strong) PFQuery *tankNameQuery;
@property (nonatomic, strong) PFQuery *tankCapacityQuery;
@property (strong, nonatomic) NSArray *array;
@property (nonatomic, strong) PFUser *user;

@end
