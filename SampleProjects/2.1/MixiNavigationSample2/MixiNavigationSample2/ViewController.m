//
//  ViewController.m
//  MixiNavigationSample2
//
//  Created by yuichi.takeda on 2/4/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"hoge%ld", self.navigationController.viewControllers.count];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MixiViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
