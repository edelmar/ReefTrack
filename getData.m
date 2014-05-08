//
//  getData.m
//  ReefTrack
//
//  Created by Studio Symposium on 4/22/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import "getData.h"
#import "tankListViewController.h"
#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import "MBProgressHUD.h"

@implementation getData
@synthesize savedTankQuery;
@synthesize savedTankObjects;
@synthesize testObject;
@synthesize testObjects;

static getData *_savedTankInstance = nil;
static getData *_savedTankArray = nil;

+ (void)getSavedTanks:(void (^)(NSArray *))completion;
{
    PFUser *userName = [PFUser currentUser];
    NSString *userNameString = [userName objectForKey:@"username"];
    
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"SavedTanks"];
    [query whereKey:@"userName" equalTo:userNameString];
    [query setValue:@"SavedTanks" forKeyPath:@"parseClassName"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            NSLog(@"Houston we have no problem");
            completion(objects);
        }
        else
        {
            NSLog(@"Houston, we have a problem.  I just watched Gravity at 2am.");
            completion(nil);
        }
    }];
    NSLog(@"YEAH BITCH!");
}

@end
