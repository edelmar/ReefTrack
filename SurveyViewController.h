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

@interface SurveyViewController : UIViewController <UITextFieldDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>
{

}


// COMMON OBJECTS
@property (strong, nonatomic) PFObject *savedTank;
@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
-(IBAction)textFieldReturn:(id)sender;


// VIEW SPECIFIC OBJECTS
@property (strong, nonatomic) IBOutlet UIImage *primaryTankImage;
@property (strong, nonatomic) IBOutlet UITextField *tankName;
@property (strong, nonatomic) IBOutlet UITextField *tankCapacity;
@property (strong, nonatomic) IBOutlet UITableView *tankLights;
@property (strong, nonatomic) IBOutlet UITableView *tankFiltration;
@property (strong, nonatomic) IBOutlet UITableView *tankMovement;


@end