//
//  NIMModalViewController.m
//  NavigationInModal
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "NIMModalViewController.h"

@interface NIMModalViewController ()

@end

@implementation NIMModalViewController


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

    self.title = [NSString stringWithFormat:@"%d", self.navigationController.viewControllers.count];

    // TODO ここに navigation bar の右上をpushするボタンを配置するコードを書く
    // TODO さらに、一番先頭に戻るボタンを左に配置する

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
