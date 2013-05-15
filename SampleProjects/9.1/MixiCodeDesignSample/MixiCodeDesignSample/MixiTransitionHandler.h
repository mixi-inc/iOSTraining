//
//  MixiTransitionHandler.h
//  MixiCodeDesignSample
//
//  Created by 田村 航弥 on 2013/05/15.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixiTransitionHandler : NSObject

+(void)pushSecoundViewControllerWithViewController:(UIViewController *)viewController;
+(void)pushThirdViewControllerWithViewController:(UIViewController *)viewController;
+(void)presentScountViewControllerWithViewController:(UIViewController *)viewController;
+(void)presentThirdViewControllerWithViewController:(UIViewController *)viewController;

@end
