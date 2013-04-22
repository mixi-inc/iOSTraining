//
//  MixiSecondViewController.m
//  MixiViewSample
//
//  Created by 田村 航弥 on 2013/04/18.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiSecondViewController.h"

@interface MixiSecondViewController ()
- (IBAction)pressButton:(UIButton *)sender;
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

    [[self.view viewWithTag:5] removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressButton:(UIButton *)sender
{
    NSLog(@"%d", sender.tag);
}
@end
