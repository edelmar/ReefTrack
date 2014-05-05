//
//  TankViewController.h
//  ReefTrack
//
//  Created by Studio Symposium on 4/15/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AssetsLibrary/AssetsLibrary.h>

@interface TankViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
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
@property (strong, nonatomic) IBOutlet UILabel *lastUpdatedLabel;

@property (nonatomic) NSString *passedValue;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSMutableArray *assets;

// BUTTONS

@property (strong, nonatomic) NSMutableArray *tankLightsArray;
@property (strong, nonatomic) NSMutableArray *tankFilterArray;
@property (strong, nonatomic) NSMutableArray *tankMovementArray;
@property (strong, nonatomic) NSMutableArray *tankImagesArray;
@property (strong, nonatomic) IBOutlet UIAlertView *inputAlert;
@property (copy) IBOutlet NSString *LightsString;
@property (copy) IBOutlet NSString *FiltrationString;
@property (copy) IBOutlet NSString *MovementString;

// IMAGE COLLECTION VIEW

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;


@end
