//
//  photoHandler.m
//  ReefTrack
//
//  Created by Studio Symposium on 5/5/14.
//  Copyright (c) 2014 Studio Symposium. All rights reserved.
//

#import "photoHandler.h"

@interface photoHandler ()

@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;

@end

@implementation photoHandler

- (void) setAsset:(ALAsset *)asset
{
    _asset = asset;
    self.photoImageView.image = [UIImage imageWithCGImage:[asset thumbnail]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
