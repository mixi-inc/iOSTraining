//
//  EFMViewController.m
//  EternalForceModal
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "EFMViewController.h"

@interface EFMViewController ()

@end

@implementation EFMViewController

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

- (IBAction)buttonTapped:(id)sender {

    EFMSecondViewController *secondViewController = [[EFMSecondViewController alloc] initWithNibName:@"EFMSecondViewController" bundle:nil];
    // TODO secondViewControllerのdelegateを自分にセット
    // TODO [self presentViewController:￼ animated:￼ completion:￼] を呼ぶ

    secondViewController.delegate = self; // [5] delegate 先として自身を代入
    [self presentViewController:secondViewController animated:YES completion:nil];

}

#pragma EMFSecondViewController delegate
// TODO EFMSecondViewController の delegateメソッドを実装
- (void)didPressCloseButton
{
    [self dismissViewControllerAnimated:YES completion:^{
        EFMSecondViewController *secondViewController = [[EFMSecondViewController alloc] init];
        secondViewController.delegate = self; // [5] delegate 先として自身を代入
        [self presentViewController:secondViewController animated:YES completion:nil];
    }];
}


@end
