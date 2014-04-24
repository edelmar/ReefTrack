//
//  getData.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/22/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "tankListViewController.h"

@class tankListViewController;

@interface getData : NSObject

{
    @private
    PFQuery *savedTankQuery;
}

- (NSDictionary *)getSavedTankObjects;
+ (getData *)getSavedTanks;
+ (NSArray *)savedTankArray;

@property (nonatomic, retain) NSArray *savedTankObjects;


@property (nonatomic, retain) PFQuery *savedTankQuery;


@end
