//
//  MixiViewController.m
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiSampleViewController.h"

@interface MixiViewController ()

@property (nonatomic, strong) MixiSampleViewController *sampleVC;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSObject *obj = [[NSObject alloc] init];

    _sampleVC = [[MixiSampleViewController alloc] initWithNibName:@"MixiSampleViewController" bundle:nil];
    [self.view addSubview:_sampleVC.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressAddButton:(id)sender {
    [self.view addSubview:_sampleVC.view];
}

- (IBAction)pressRemoveButton:(id)sender {
    [_sampleVC.view removeFromSuperview];
}
@end
