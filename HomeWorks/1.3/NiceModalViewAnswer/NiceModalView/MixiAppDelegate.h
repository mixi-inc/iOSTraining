//
//  MixiAppDelegate.h
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import <UIKit/UIKit.h>

// @class と #include は何が違うか探してみましょう
@class MixiNiceViewController;

@interface MixiAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MixiNiceViewController *viewController;
@end
