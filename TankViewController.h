//
//  TankViewController.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/15/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TankViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}

// VIEWS AND CELLS
@property (strong, nonatomic) IBOutlet UIImageView *tankImages;
@property (strong, nonatomic) IBOutlet UIImage *tankNewImage;

@property (strong, nonatomic) IBOutlet UITableView *tankLights;
@property (strong, nonatomic) IBOutlet UITableView *tankFiltration;
@property (strong, nonatomic) IBOutlet UITableView *tankMovement;

@property (strong, nonatomic) IBOutlet UILabel *tankNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *tankCapacityLabel;

@property (nonatomic) NSString *passedValue;
@property (strong, nonatomic) NSArray *array;

// BUTTONS
@property (strong, nonatomic) IBOutlet UIButton *changeWaterButton;
@property (strong, nonatomic) IBOutlet UIButton *changeFilterButton;
@property (strong, nonatomic) IBOutlet UIButton *changeLightsButton;
@property (strong, nonatomic) IBOutlet UIButton *changeMovementButton;
@property (strong, nonatomic) IBOutlet UIButton *changeImageButton;


@property (strong, nonatomic) NSMutableArray *tankLightsArray;
@property (strong, nonatomic) NSMutableArray *tankFilterArray;
@property (strong, nonatomic) NSMutableArray *tankMovementArray;
@property (strong, nonatomic) IBOutlet UIAlertView *inputAlert;
@property (copy) IBOutlet NSString *LightsString;
@property (copy) IBOutlet NSString *FiltrationString;
@property (copy) IBOutlet NSString *MovementString;


@end
