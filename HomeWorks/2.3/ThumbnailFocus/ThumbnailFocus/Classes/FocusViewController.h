//
//  FocusViewController.h
//  ThumbnailFocus
//
//  Created by 鄭 基旭 on 2013/04/18.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FocusManager.h"

@class ImageScrollView;

@interface FocusViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) ImageScrollView *scrollView;
- (void)updateOrientationAnimated:(BOOL)animated;
@end
