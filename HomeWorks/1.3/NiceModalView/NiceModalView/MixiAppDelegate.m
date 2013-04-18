//
//  MixiAppDelegate.m
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "MixiAppDelegate.h"
#import "MixiNiceViewController.h"

@implementation MixiAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.

    // TODO: MixiNiceViewControllerを XIBファイルを使って初期化します。
	self.viewController = [[MixiNiceViewController alloc] initWithNibName:@"MixiNiceViewController" bundle:nil];

    // TODO: 生成した self.viewControllerを　windowのRootViewControllerとして設定します。
	self.window.rootViewController = self.viewController;

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
