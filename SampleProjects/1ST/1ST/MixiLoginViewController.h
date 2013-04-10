//
//  MixiLoginViewController.h
//  1ST
//
//  Created by 田村 航弥 on 2013/04/10.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MixiLoginViewController : UIViewController

- (IBAction)pressCloseButton:(id)sender;

@property (nonatomic, weak) id delegate;

@end

@protocol MixiLoginViewControllerDelegate <NSObject>

-(void)didPressCloseButton;

@end