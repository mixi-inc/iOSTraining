//
//  NIMViewController.m
//  NavigationInModal
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "NIMViewController.h"
#import "NIMModalViewController.h"

@interface NIMViewController ()

@end

@implementation NIMViewController

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
- (IBAction)modalButtonTapped:(id)sender {

    // 一度モーダルで表示させたのには特に意味はありません(途中で宿題の中身を変えたためです)
    NIMModalViewController *modal = [[NIMModalViewController alloc] initWithNibName:@"NIMModalViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:modal];
    [self presentViewController:navigationController animated:YES completion:nil];
}

@end
