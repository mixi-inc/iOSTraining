//
//  MixiViewController.m
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiSampleViewController.h"
#import "NSString+HogeAddition.h"
#import "MixiSampleClass.h"

@interface MixiViewController ()

@property (nonatomic, strong) MixiSampleViewController *sampleVC;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MixiSampleClass *obj = [[MixiSampleClass alloc] initWithName:@"tamura" sampleType:SampleTypeFuga];
    NSLog(@"%@", [obj.name addHoge]);


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

- (void)pressModalButton:(id)sender
{
    MixiChildViewController *mixiChildViewController = [[MixiChildViewController alloc] init];
    mixiChildViewController.delegate = self; // [5] delegate 先として自身を代入
    [self presentViewController:mixiChildViewController animated:YES completion:nil];
}

// [6] delegate method の実装
#pragma mark - MixiPostViewControllerDelegate methods
-(void)didPressCloseButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@, %@", self.presentingViewController, self.presentedViewController);
}

@end
