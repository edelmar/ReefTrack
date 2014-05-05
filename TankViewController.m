//
//  TankViewController.m
//  ReefTrack
//
//  Created by Studio Symposium on 4/15/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import "TankViewController.h"
#import "tankListViewController.h"
#import "photoHandler.h"
#import <Parse/Parse.h>
#import "getData.h"
#import <AssetsLibrary/AssetsLibrary.h>

@class getData;

@interface TankViewController ()

@end

@implementation TankViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [[UITableViewCell appearance] setBackgroundColor:[UIColor clearColor]];
    
    [[UITableView appearance] setBackgroundColor:[UIColor clearColor]];
    
    _tankFiltration.tag = 0;
    _tankFiltration.dataSource = self;
    _tankFiltration.delegate = self;
    
    _tankLights.tag = 1;
    _tankLights.dataSource = self;
    _tankLights.delegate = self;
    
    _tankMovement.tag = 2;
    _tankMovement.dataSource = self;
    _tankMovement.delegate = self;
    
    
    _assets = [@[] mutableCopy];
    __block NSMutableArray *tmpAssets = [@[] mutableCopy];
    // 1 Grab our static instance of the ALAssetsLibrary
    ALAssetsLibrary *assetsLibrary = [TankViewController defaultAssetsLibrary];
    // 2 Enumerate through all of the ALAssets (photos) in the user’s Asset Groups (Folders)

    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
            {
                // 3 Enumerate each folder and add it’s ALAssets to the temporary array

                [tmpAssets addObject:result];
            }
        }];
        
        // 4 Sort the assets list by date (this won’t work yet, but I will show you how to fix later). For now this code is commented out and the Assets will be sorted however they come out.

        //NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
        //self.assets = [tmpAssets sortedArrayUsingDescriptors:@[sort]];
        self.assets = tmpAssets;
        
        // 5 Reload the UICollectionView (this won’t work yet as we haven’t set up the delegate methods)

        [self.collectionView reloadData];
    } failureBlock:^(NSError *error) {
        NSLog(@"Error loading images %@", error);
    }];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

- (void)viewDidAppear:(BOOL)animated
{
    PFQuery *tankQuery = [PFQuery queryWithClassName:@"SavedTanks"];
    PFObject *tankObject = [tankQuery getObjectWithId:_passedValue];
    _array = [NSArray arrayWithArray:[tankObject objectForKey:_passedValue]];
    
    NSString *tankCapString = [tankObject valueForKey:@"tankCapacity"];
    NSString *titleString = [tankObject valueForKey:@"tankName"];
    NSDate *lastUpdatedDate = [tankObject valueForKey:@"updatedAt"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm/dd/yy"];
    
    NSString *stringFromDate = [formatter stringFromDate:lastUpdatedDate];
    
    
    self.title = titleString;
    _tankNameLabel.text = titleString;
    _tankCapacityLabel.text = tankCapString;
    _lastUpdatedLabel.text = stringFromDate;
    
}

- (IBAction)button:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 0:
            [self performSelector:@selector(photoHandler)];
            NSLog(@"New Image Button Tapped");
            break;
        case 1:
            NSLog(@"New Filtration Button Tapped");
            break;
        case 2:
            NSLog(@"New Lights Button Tapped");
            break;
        case 3:
            NSLog(@"New Water Movement Button Tapped");
            break;
        default:
            break;
    }
}

- (void)photoHandler
{
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.allowsEditing = YES;
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:controller animated:YES completion:nil];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
/*    PFQuery *tankQuery = [PFQuery queryWithClassName:@"SavedTanks"];
    PFObject *tankObject = [tankQuery getObjectWithId:_passedValue];
    
    _tankImagesArray = [tankObject objectForKey:@"tankImages"];*/
    
    return self.assets.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    photoHandler *cell = (photoHandler *)[collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    ALAsset *asset = self.assets[indexPath.row];
    cell.asset = asset;
    cell.backgroundColor = [UIColor clearColor];
    collectionView.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"Cell";
    NSString *cellText = [[NSString alloc]init];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch (tableView.tag)
    {
        case 0:
            _tankFiltration = [_tankFilterArray objectAtIndex:indexPath.row];
            cellText = [_tankFilterArray objectAtIndex:indexPath.row];
            cell.textLabel.text = cellText;
            break;
        case 1:
            _tankLights = [_tankLightsArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [_tankLightsArray objectAtIndex:indexPath.row];
            break;
        case 2:
            _tankMovement = [_tankMovementArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [_tankMovementArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PFQuery *tankQuery = [PFQuery queryWithClassName:@"SavedTanks"];
    PFObject *tankObject = [tankQuery getObjectWithId:_passedValue];
    _array = [NSArray arrayWithArray:[tankObject objectForKey:_passedValue]];
    _tankFilterArray = [tankObject objectForKey:@"tankFiltration"];
    _tankLightsArray = [tankObject objectForKey:@"tankLights"];
    _tankMovementArray = [tankObject objectForKey:@"tankMovement"];
    
    if (tableView.tag == 0)
    {
        // MAKE FILTRATION TAG HERE
        return _tankFilterArray.count;
    }
    if (tableView.tag == 1)
    {
        // MAKE LIGHTS TAG HERE
        return _tankLightsArray.count;
    }
    if (tableView.tag == 2)
    {
        // MAKE MOVEMENT TAG HERE
        return _tankMovementArray.count;
    }
    
    NSLog(@"Tank Movement Array Items: %lu", (unsigned long)_tankMovementArray.count);
    NSLog(@"Tank Lights Array Items: %lu", (unsigned long)_tankLightsArray.count);
    NSLog(@"Tank Filtration Array Items: %lu", (unsigned long)_tankFilterArray.count);
    
    return _tankMovementArray.count;
    return _tankLightsArray.count;
    return _tankFilterArray.count;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
