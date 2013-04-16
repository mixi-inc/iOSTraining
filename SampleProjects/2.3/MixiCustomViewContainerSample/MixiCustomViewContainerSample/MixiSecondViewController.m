//
//  MixiSecondViewController.m
//  MixiCustomViewContainerSample
//
//  Created by 田村 航弥 on 2013/04/12.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiSecondViewController.h"

@interface MixiSecondViewController ()

@end

@implementation MixiSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"will appear: %d", self.isMovingToParentViewController);
    NSLog(@"will appear: %d", self.isMovingFromParentViewController);
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"did appear: %d", self.isMovingToParentViewController);
    NSLog(@"did appear: %d", self.isMovingFromParentViewController);
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"will disappear: %d", self.isMovingToParentViewController);
    NSLog(@"will disappear: %d", self.isMovingFromParentViewController);
}

-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"will disappear: %d", self.isMovingToParentViewController);
    NSLog(@"will disappear: %d", self.isMovingFromParentViewController);
}

@end
