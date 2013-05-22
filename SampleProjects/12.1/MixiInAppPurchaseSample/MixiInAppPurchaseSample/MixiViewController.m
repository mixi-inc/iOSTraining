//
//  MixiViewController.m
//  MixiInAppPurchaseSample
//
//  Created by 田村 航弥 on 2013/05/21.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiStoreViewController.h"

@interface MixiViewController ()

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

- (IBAction)pressLauchStore:(id)sender
{
    if([SKPaymentQueue canMakePayments]){
        MixiStoreViewController *storeVC = [[MixiStoreViewController alloc] init];
        [self presentViewController:storeVC animated:YES completion:nil];
    }else{
        NSLog(@"設定で off にされてる。");
    }
}
@end
