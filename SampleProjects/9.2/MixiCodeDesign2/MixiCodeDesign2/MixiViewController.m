//
//  MixiViewController.m
//  MixiCodeDesign2
//
//  Created by 田村 航弥 on 2013/05/15.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiSharedObject.h"

@interface MixiViewController ()

@property (nonatomic, strong) MixiDailyView *dailyView;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _dailyView = [MixiDailyChoiceView dailyView];
    _dailyView.center = self.view.center;
    _dailyView.delegate = self;
    [self.view addSubview:_dailyView];

    _array = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        [_array addObject:[MixiSharedObject sharedInstance]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dailyViewDidPressCloseButton
{
    [_dailyView removeFromSuperview];
}

-(void)dailyViewDidPressYesButton
{
    //do something
    NSLog(@"Yes");
}

-(void)dailyViewDidPressNoButton
{
    //do something
    NSLog(@"No");
}

@end
