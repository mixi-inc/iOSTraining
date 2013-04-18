//
//  MixiViewController.m
//  MixiNavigationSample
//
//  Created by 田村 航弥 on 2013/04/10.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = [NSString stringWithFormat:@"%d", [self.navigationController.viewControllers count]];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"pop" style:UIBarButtonItemStylePlain target:self action:@selector(pressPopButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressPushButton:(id)sender
{
    [self.navigationController pushViewController:[[MixiViewController alloc] init] animated:YES];
    NSLog(@"%d", [self.navigationController.viewControllers count]);
}

- (void)pressPopButton
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
