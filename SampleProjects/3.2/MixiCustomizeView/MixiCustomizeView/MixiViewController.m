//
//  MixiViewController.m
//  MixiCustomizeView
//
//  Created by Koya Tamura on 2013/04/21.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiCustomizedView2.h"

@interface MixiViewController ()

@end

static CGRect const kCustomizedViewFrame = {{0, 220},{320, 200}};

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    MixiCustomizedView2 *customizedView = [[MixiCustomizedView2 alloc]initWithFrame:kCustomizedViewFrame];
    [self.view addSubview:customizedView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
