//
//  MixiViewController.m
//  SampleOfPods
//
//  Created by 武田 祐一 on 2013/05/15.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiViewController.h"

#import <Reachability.h>

#import <BlocksKit.h>

@interface MixiViewController ()

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachability currentReachabilityStatus];

    switch (status) {
        case NotReachable:
            NSLog(@"not reachable");
            break;

        case ReachableViaWiFi:
            NSLog(@"wifi");
            break;

        case ReachableViaWWAN:
            NSLog(@"wwan");
            break;

        default:
            break;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"BlocksKitを利用"];
    [alertView addButtonWithTitle:@"First" handler:^{
        NSLog(@"first button is tapped");
    }];

    [alertView addButtonWithTitle:@"Second" handler:^{
        NSLog(@"second button is tapped");
    }];

    [alertView show];
}



- (IBAction)showActionSheet:(id)sender {

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"BlocksKitを利用"];

    [actionSheet addButtonWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }];

    [actionSheet setDestructiveButtonWithTitle:@"赤いボタン" handler:^{
        NSLog(@"DestructiveButton tapped");
    }];


    [actionSheet setCancelButtonWithTitle:@"キャンセルボタン" handler:^{
        NSLog(@"Cancel Button Tapped");
    }];

    [actionSheet showInView:self.view];

}

@end
