//
//  MixiChildViewController.h
//  1ST
//
//  Created by 田村 航弥 on 2013/04/10.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MixiGrandchildViewController.h"

@protocol MixiChildViewControllerDelegate <NSObject> // [1] プロトコルの宣言

-(void)didPressCloseButton;

@end

@interface MixiChildViewController : UIViewController//<MixiGrandchildViewControllerDelegate>

@property (nonatomic, weak) id<MixiChildViewControllerDelegate> delegate; // [2] delegate オブジェクト

- (IBAction)pressModalButton:(id)sender;
-(IBAction)pressClosedButton:(id)sender;

@end

