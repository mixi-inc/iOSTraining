//
//  MixiViewController.m
//  MixiNavigationSample2
//
//  Created by yuichi.takeda on 2/4/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "MixiViewController.h"

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%ld", self.navigationController.viewControllers.count];
}

- (IBAction)pushButtonTapped:(id)sender
{
    MixiViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MixiViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)pressPopButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
