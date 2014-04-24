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

@interface tankListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
{
    getData *retrieveData;
}

//+ (NSString *)parseClassName;


// GOOD 4/24/14 //
@property (strong, nonatomic) IBOutlet UITableView *tankList;
@property (strong, nonatomic) NSArray *array;
// GOOD 4/24/14 //



@property (strong, nonatomic) IBOutlet UITableViewCell *tankCell;
@property (strong, nonatomic) IBOutlet UILabel *tankNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *tankCapLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastUpdatedLabel;
@property (strong, nonatomic) IBOutlet UIImageView *lastImage;

@end
