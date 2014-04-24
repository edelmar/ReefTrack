//
//  tankListViewController.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/16/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "getData.h"

@class getData;

@interface tankListViewController : PFQueryTableViewController <UITableViewDataSource, UITableViewDelegate, PF_EGORefreshTableHeaderDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, PFSubclassing>
{
    getData *retrieveData;
}

+ (NSString *)parseClassName;

@property (strong, nonatomic) IBOutlet PFQueryTableViewController *tankList;
@property (strong, nonatomic) IBOutlet UITableViewCell *tankCell;
@property (strong, nonatomic) IBOutlet UILabel *tankNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *tankCapLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastUpdatedLabel;
@property (strong, nonatomic) IBOutlet UIImageView *lastImage;

@end
