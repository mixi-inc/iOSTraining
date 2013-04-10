//
//  MixiPostViewController.h
//  1ST
//
//  Created by 田村 航弥 on 2013/04/10.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixiLoginViewController.h"

@protocol MixiPostViewControllerDelegate;

@interface MixiPostViewController : UIViewController<MixiPostViewControllerDelegate>

@property (nonatomic, weak) id delegate;

- (IBAction)pressModalButton:(id)sender;
-(IBAction)pressClosedButton:(id)sender;

@end

@protocol MixiPostViewControllerDelegate <NSObject>

-(void)didPressCloseButton;

@end