//
//  SurveyViewController.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/15/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>
#import <Parse/Parse.h>

@interface SurveyViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, PFLogInViewControllerDelegate>
{

}


// COMMON OBJECTS
@property (strong, nonatomic) PFObject *savedTank;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) PFUser *user;
-(IBAction)textFieldReturn:(id)sender;
-(IBAction)addEquipment:(id)sender;


// VIEW SPECIFIC OBJECTS
@property (strong, nonatomic) IBOutlet UIImage *primaryTankImage;
@property (strong, nonatomic) IBOutlet UITextField *tankName;
@property (strong, nonatomic) IBOutlet UITextField *tankCapacity;
@property (strong, nonatomic) IBOutlet UITableView *tankLights;
@property (strong, nonatomic) IBOutlet UITableView *tankFiltration;
@property (strong, nonatomic) IBOutlet UITableView *tankMovement;
@property (strong, nonatomic) NSMutableArray *tankLightsArray;
@property (strong, nonatomic) NSMutableArray *tankFilterArray;
@property (strong, nonatomic) NSMutableArray *tankMovementArray;
@property (strong, nonatomic) IBOutlet UIAlertView *inputAlert;
@property (copy) IBOutlet NSString *LightsString;
@property (copy) IBOutlet NSString *FiltrationString;
@property (copy) IBOutlet NSString *MovementString;


@property (nonatomic, weak) UITableView *tableView;

@end
