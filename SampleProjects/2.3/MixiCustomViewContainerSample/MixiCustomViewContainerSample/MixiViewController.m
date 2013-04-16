//
//  MixiViewController.m
//  MixiCustomViewContainerSample
//
//  Created by 田村 航弥 on 2013/04/12.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiFirstViewController.h"
#import "MixiSecondViewController.h"

@interface MixiViewController ()

@property (weak, nonatomic) IBOutlet UIView *dummyView;
- (IBAction)pressFirstButton:(id)sender;
- (IBAction)pressSecondButton:(id)sender;
@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    MixiFirstViewController *fvc = [[MixiFirstViewController alloc] init];
    [self addChildViewController:fvc]; // [1] childViewController に追加
    fvc.view.frame = _dummyView.frame;
    [self.view addSubview:fvc.view];
    [fvc didMoveToParentViewController:self]; // [2] childViewController に追加終了したことを通知
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)transitionFromViewController:(UIViewController *)fromViewController
                   toViewController:(UIViewController *)toViewController
{
    [fromViewController willMoveToParentViewController:nil]; //[3] 
    [self addChildViewController:toViewController];

    toViewController.view.frame = CGRectMake(0, -_dummyView.frame.size.height, _dummyView.frame.size.width, _dummyView.frame.size.height);

    // [4] 画面遷移メソッド
    [self transitionFromViewController:fromViewController
                      toViewController:toViewController
                              duration:0.5
                               options:0
                            animations:^{
                                toViewController.view.frame = fromViewController.view.frame;
                                fromViewController.view.frame = CGRectMake(0, 50, _dummyView.frame.size.width, _dummyView.frame.size.height);
                            } completion:^(BOOL finished) {
                                [fromViewController removeFromParentViewController];
                                [toViewController didMoveToParentViewController:self];
                            }];
}


- (IBAction)pressFirstButton:(id)sender
{
    UIViewController *currentVC = self.childViewControllers[0];
    MixiFirstViewController *newVC = [[MixiFirstViewController alloc] init];
    [self transitionFromViewController:currentVC toViewController:newVC];
}

- (IBAction)pressSecondButton:(id)sender
{
    UIViewController *currentVC = self.childViewControllers[0];
    MixiSecondViewController *newVC = [[MixiSecondViewController alloc] init];
    [self transitionFromViewController:currentVC toViewController:newVC];
}

@end
