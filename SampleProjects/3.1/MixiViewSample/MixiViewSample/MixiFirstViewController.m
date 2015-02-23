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

    // 課題3.1-1 幾つかのViewを表示する

    // UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 21)];
    label.text = @"Hello World!";
    [self.view addSubview:label];

    // UIButton
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 50, 70, 21)];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    // UITextField
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 100, 21)];
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField];

    // UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 150, 128, 128)];
    imageView.image = [UIImage imageNamed:@"ojisan.png"];
    [self.view addSubview:imageView];

    // UITextView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 300, 280, 100)];
    textView.text = @"あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。\nまたそのなかでいっしょになったたくさんのひとたち、ファゼーロとロザーロ、羊飼のミーロや、顔の赤いこどもたち、地主のテーモ、山猫博士のボーガント・デストゥパーゴなど、いまこの暗い巨きな石の建物のなかで考えていると、みんなむかし風のなつかしい青い幻燈のように思われます。では、わたくしはいつかの小さなみだしをつけながら、しずかにあの年のイーハトーヴォの五月から十月までを書きつけましょう。";
    [self.view addSubview:textView];

//    // 課題3.1-2 特定のviewだけ削除する
//    for (UIView *view in self.view.subviews) {
//        if ([view isKindOfClass:[UIImageView class]]) {
//            [view removeFromSuperview];
//        }
//    }

}

- (void)handle:(id)sender{

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
