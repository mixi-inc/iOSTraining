//
//  MixiViewController.m
//  MixiNavigationSample2
//
//  Created by yuichi.takeda on 2/4/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "MixiViewController.h"

@implementation MixiViewController

- (IBAction)pushButtonTapped:(id)sender
{
    MixiViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MixiViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
