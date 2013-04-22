//
//  MixiFirstViewController.m
//  MixiViewSample
//
//  Created by 田村 航弥 on 2013/04/18.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiFirstViewController.h"

@interface MixiFirstViewController ()

@end

@implementation MixiFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", self.view.subviews);
    for (UIView *view in self.view.subviews){
        if([view isKindOfClass:[UIButton class]]){
            UIView *subview = [[UIView alloc] initWithFrame:view.frame];
            [subview setBackgroundColor:[UIColor redColor]];
            subview.alpha = 0.5;
            [self.view insertSubview:subview belowSubview:view];
        }
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
