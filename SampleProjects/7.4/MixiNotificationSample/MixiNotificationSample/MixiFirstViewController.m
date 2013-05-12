//
//  MixiFirstViewController.m
//  MixiNotificationSample
//
//  Created by Koya Tamura on 2013/05/12.
//  Copyright (c) 2013年 Koya Tamura. All rights reserved.
//

#import "MixiFirstViewController.h"

@interface MixiFirstViewController ()

- (IBAction)pressPostNotification:(id)sender;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressPostNotification:(id)sender
{
    NSDictionary *dict = @{@"key":@"value"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationName" object:self userInfo:dict];
}
@end


