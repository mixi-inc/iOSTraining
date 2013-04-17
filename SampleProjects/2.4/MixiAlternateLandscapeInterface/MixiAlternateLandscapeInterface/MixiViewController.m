//
//  MixiViewController.m
//  MixiAlternateLandscapeInterface
//
//  Created by 田村 航弥 on 2013/04/17.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiLandscapeViewController.h"

@interface MixiViewController ()

@property (nonatomic, strong) MixiLandscapeViewController *landscapeVC;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // UIDevice オブジェクトからの回転通知生成を宣言
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];

    // UIDevice からの通知受け取り登録
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    _landscapeVC = [[MixiLandscapeViewController alloc] initWithNibName:@"MixiLandscapeViewController" bundle:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 通知時のメソッド
- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationIsLandscape(deviceOrientation))
    {
        [self presentViewController:_landscapeVC animated:NO completion:nil];
    }
    else if (UIDeviceOrientationIsPortrait(deviceOrientation))
    {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

// for iOS6
-(BOOL)shouldAutorotate
{
    return NO;
}
@end
