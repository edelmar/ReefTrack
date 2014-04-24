//
//  TankViewController.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/15/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TankViewController : UIViewController
{
    
}

// VIEWS AND CELLS
@property (strong, nonatomic) IBOutlet UIImageView *tankImages;
@property (strong, nonatomic) IBOutlet UIImage *tankNewImage;
@property (strong, nonatomic) IBOutlet UITableView *tankWTList;
@property (strong, nonatomic) IBOutlet UITableViewCell *tankWTListCell;
@property (strong, nonatomic) IBOutlet UITableView *tankWCList;
@property (strong, nonatomic) IBOutlet UITableViewCell *tankWCListCell;
@property (strong, nonatomic) IBOutlet UITableView *tankStockList;


// BUTTONS
@property (strong, nonatomic) IBOutlet UIButton *changeWaterButton;
@property (strong, nonatomic) IBOutlet UIButton *changeFilterButton;
@property (strong, nonatomic) IBOutlet UIButton *changeLightsButton;
@property (strong, nonatomic) IBOutlet UIButton *changeMovementButton;
@property (strong, nonatomic) IBOutlet UIButton *changeImageButton;
//@property (strong, nonatomic) IBOutlet UIButton *newTankImageButton;
//@property (strong, nonatomic) IBOutlet UIButton *newStockButton;

@end
