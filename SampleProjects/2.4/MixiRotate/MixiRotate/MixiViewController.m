//
//  MixiViewController.m
//  MixiRotate
//
//  Created by 田村 航弥 on 2013/04/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

static CGRect const kPortraitBuleViewRect = { { 32.0f, 18.0f }, { 150.0f, 150.0f } };
static CGRect const kLandscapeBuleViewRect = { { 18.0f, 32.0f }, { 150.0f, 150.0f } };
static CGRect const kPortraitYellowViewRect = { { 32.0f, 185.0f }, { 150.0f, 150.0f } };
static CGRect const kLandscapeYellowViewRect = { { 185.0f, 32.0f }, { 150.0f, 150.0f } };

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

// [3] 回転前処理
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                               duration:(NSTimeInterval)duration
{
    NSLog(@"will rotate");
}

// [4] 回転する場合任意のアニメーションをここで設定
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                        duration:(NSTimeInterval)duration
{
    NSLog(@"will animate");
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        [_blueView setFrame:kPortraitBuleViewRect];
        [_yellowView setFrame:kPortraitYellowViewRect];
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight
               || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        [_blueView setFrame:kLandscapeBuleViewRect];
        [_yellowView setFrame:kLandscapeYellowViewRect];
    }
}

// [5] 回転完了処理
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"did rotate");
}

- (void)viewDidUnload {
    [self setBlueView:nil];
    [self setYellowView:nil];
    [super viewDidUnload];
}

// [2] view の描画
-(void)viewWillLayoutSubviews
{
    NSLog(@"will layout subviews");
}

// [1] rootViewController から回転通知が各 ViewController に通達される
// 各 ViewController は自身が回転に対応するかどうかを返答する
//only iOS6 書かなくても project summary で設定している方向に回転する(plist 優先)
-(NSUInteger)supportedInterfaceOrientations
{
    NSLog(@"rotate support on ios6");
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape;
}

// only iOS5 and earlier
// 書いていないと回転対応できない。project summary (plist) で宣言していなくても回転する
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    NSLog(@"rotate support on ios5 and earlier");
    if ((toInterfaceOrientation == UIInterfaceOrientationPortrait)
        || (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        || (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight))
    {
        return YES;
    }
    return NO;
}

@end
