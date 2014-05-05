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
#import "MBProgressHUD.h"

@class tankListViewController;

@interface getData : NSObject

{
    @private

    PFQuery *savedTankQuery;
    
}

//+ (void) getSavedTanks:(NSArray *)array completion:(void(^)(void))completion;

+ (void)getSavedTanks:(void (^)(NSArray *))completion;

//- (NSDictionary *)getSavedTankObjects;

@property (nonatomic, retain) PFObject  *testObject;
@property (nonatomic, retain) NSArray *testObjects;
@property (nonatomic, retain) NSArray *savedTankObjects;
@property (nonatomic, retain) PFQuery *savedTankQuery;



@end
