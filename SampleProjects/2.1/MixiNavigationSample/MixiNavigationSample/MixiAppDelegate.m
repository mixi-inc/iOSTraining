//
//  MixiAppDelegate.m
//  MixiNavigationSample
//
//  Created by 田村 航弥 on 2013/04/10.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiAppDelegate.h"

#import "MixiViewController.h"

@implementation MixiAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeAppearance];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[MixiViewController alloc] initWithNibName:@"MixiViewController" bundle:nil];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.viewController];

    for(NSInteger i = 0; i < 4; i ++){
        [array addObject:[[MixiViewController alloc] initWithNibName:@"MixiViewController" bundle:nil]];
    }
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:_viewController];
    [navigationController setViewControllers:array];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)customizeAppearance
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"customNavBarImage1"] forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTintColor:[UIColor blackColor]];
}
@end
