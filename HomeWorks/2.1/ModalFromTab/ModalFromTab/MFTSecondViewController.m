//
//  MFTSecondViewController.m
//  ModalFromTab
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MFTSecondViewController.h"

@interface MFTSecondViewController ()

@end

@implementation MFTSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
