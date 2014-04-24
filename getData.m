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


@implementation getData
@synthesize savedTankQuery;
@synthesize savedTankObjects;

static getData *_savedTankInstance = nil;
static getData *_savedTankArray = nil;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [getData init];
    }
    return self;
}



+ (getData *)getSavedTanks
{
    @synchronized(self)
    
    {
        
    PFUser *userName = [PFUser currentUser];
    NSString *userNameString = [userName objectForKey:@"username"];
    
    
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"SavedTanks"];
    [query whereKey:@"userName" equalTo:userNameString];
    [query setValue:@"SavedTanks" forKeyPath:@"parseClassName"];
        
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (!error)
         {
             // The find succeeded.
             NSLog(@"Successfully retrieved %lu Tanks.", objects.count);
             // Do something with the found objects
             for (PFObject *object in objects)
             {
                 
                 
                 NSString *tankNameString = [[NSString alloc] init];
                 NSString *tankCapacityString = [[NSString alloc] init];
                 
                 tankNameString = [object valueForKey:@"tankName"];
                 tankCapacityString = [object valueForKey:@"tankCapacity"];

                 NSLog(@"%@", tankNameString);
                 NSLog(@"%@", tankCapacityString);
                 
                 NSArray *_savedTankArray = [getData savedTankArray];
                 
                 _savedTankArray = [[NSArray alloc] initWithObjects:object, nil];
                 
                 NSLog(@"TANK NAME ARRAY: %@", [_savedTankArray objectAtIndex:0]);
             }
         }
         else
         {
             // Log details of the failure
             NSLog(@"Error: %@ %@", error, [error userInfo]);
         }
     }];
    }
    return _savedTankInstance;
}

+ (NSArray *)savedTankArray
{
    return 0;
}

@end
