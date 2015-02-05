//
//  NextViewController.m
//  NavigationPractice
//
//  Created by yuichi.takeda on 2/5/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation NextViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.label.text = self.messageFromPrevious;
}

@end
