//
//  MixiStaticAnalyzerViewController.m
//  DebuggingApp
//
//  Created by 武田 祐一 on 2013/05/13.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiStaticAnalyzerViewController.h"

@interface MixiStaticAnalyzerViewController ()

@end

@implementation MixiStaticAnalyzerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Third", @"Third");
        self.tabBarItem.image = [UIImage imageNamed:@"Third"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    char *str;

    if (str == NULL) {
        printf("it it null");
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
