//
//  MixiTransitionHandler.m
//  MixiCodeDesignSample
//
//  Created by 田村 航弥 on 2013/05/15.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiTransitionHandler.h"

@implementation MixiTransitionHandler

+(void)pushSecoundViewControllerWithViewController:(UIViewController *)viewController
{
    UIViewController *vc = [[UIViewController alloc] init];
    [viewController.navigationController pushViewController:vc animated:YES];
}

+(void)pushThirdViewControllerWithViewController:(UIViewController *)viewController
{
    //do somethig
}

@end
