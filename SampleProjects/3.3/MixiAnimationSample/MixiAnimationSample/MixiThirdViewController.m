//
//  MixiThirdViewController.m
//  MixiAnimationSample
//
//  Created by Koya Tamura on 2013/04/22.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiThirdViewController.h"

@interface MixiThirdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ojisanImageView;

@end

@implementation MixiThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [UIView beginAnimations:@"HideOjisanView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(showHideDidStop:finished:context:)];
    _ojisanImageView.alpha = 0.0;
    [UIView commitAnimations];
}

- (void)showHideDidStop:(NSString *)animationID finished:(NSNumber *)finished
                context:(void *)context
{
    [UIView beginAnimations:@"ShowOjisanView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:1.0];
    _ojisanImageView.alpha = 1.0;
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
