//
//  MixiSecondViewController.m
//  MixiCoreAnimationSample
//
//  Created by Koya Tamura on 2013/04/22.
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
