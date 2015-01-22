//
//  MixiSampleViewController.h
//  MyFirstProject
//
//  Created by yuichi.takeda on 1/16/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySecondViewController.h"

@interface MixiSampleViewController : UIViewController <MySecondViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *label;
@end
