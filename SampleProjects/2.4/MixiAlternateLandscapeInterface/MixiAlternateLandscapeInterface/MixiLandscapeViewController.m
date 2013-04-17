//
//  MixiLandscapeViewController.m
//  MixiAlternateLandscapeInterface
//
//  Created by 田村 航弥 on 2013/04/17.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiLandscapeViewController.h"

@interface MixiLandscapeViewController ()

@end

@implementation MixiLandscapeViewController

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

// for iOS5 and earlier
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

@end
