//
//  MixiDebuggerViewController.m
//  DebuggingApp
//
//  Created by 武田 祐一 on 2013/05/13.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiDebuggerViewController.h"

@interface MixiDebuggerViewController ()

@end

@implementation MixiDebuggerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; ++i) {
        NSString *str = [self stringFromInteger:i];
        [array addObject:str];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)stringFromInteger:(NSInteger)num
{
    return [NSString stringWithFormat:@"debugging : %d", num];
}


@end
