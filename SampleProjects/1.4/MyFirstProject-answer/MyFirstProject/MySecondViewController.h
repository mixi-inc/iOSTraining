//
//  MySecondViewController.h
//  MyFirstProject
//
//  Created by yuichi.takeda on 1/17/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MySecondViewControllerDelegate <NSObject>
- (void)secondViewControllerButtonTapped;
@end

@interface MySecondViewController : UIViewController
@property (nonatomic, weak) id<MySecondViewControllerDelegate> delegate;
@end
