//
//  MixiViewController.m
//  MixiUserDefaultsSample
//
//  Created by 田村 航弥 on 2013/05/02.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()

- (IBAction)pressSaveButton:(id)sender;
- (IBAction)pressReadButton:(id)sender;
- (IBAction)pressReadSettingButton:(id)sender;

@end

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

- (IBAction)pressSaveButton:(id)sender
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i ++) {
        NSString *string = [NSString stringWithFormat:@"%d", i];
        [array addObject:string];
    }
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"array"];
}

- (IBAction)pressReadButton:(id)sender
{
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"array"]);
}

- (IBAction)pressReadSettingButton:(id)sender
{
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"name"]);
}
@end
