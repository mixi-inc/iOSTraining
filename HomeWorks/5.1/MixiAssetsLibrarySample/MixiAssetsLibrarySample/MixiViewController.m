//
//  MixiViewController.m
//  MixiAssetsLibrarySample
//
//  Created by 田村 航弥 on 2013/04/30.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiAssetsGroupViewController.h"

@interface MixiViewController ()

- (IBAction)pressShowAssetsGroupButton:(id)sender;
@end

@implementation MixiViewController

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

- (IBAction)pressShowAssetsGroupButton:(id)sender
{
    MixiAssetsGroupViewController *assetsGroupVC = [[MixiAssetsGroupViewController alloc] initWithNibName:@"MixiAssetsGroupViewController" bundle:nil];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:assetsGroupVC];
    [self presentViewController:nc animated:YES completion:nil];
}
@end
