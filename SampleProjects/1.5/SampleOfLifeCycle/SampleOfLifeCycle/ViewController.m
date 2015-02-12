//
//  ViewController.m
//  SampleOfLifeCycle
//
//  Created by yuichi.takeda on 2/12/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"initWithCoder:");
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear:");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear:");
}


- (void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayoutSubviews");
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews");
    [super viewDidLayoutSubviews];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisAppear");
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");
    [super viewDidDisappear:animated];
}

- (IBAction)presentButtonTapped:(id)sender {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
