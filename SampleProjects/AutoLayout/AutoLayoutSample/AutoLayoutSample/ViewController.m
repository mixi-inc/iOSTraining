//
//  ViewController.m
//  AutoLayoutSample
//
//  Created by yuichi.takeda on 3/5/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)setShortText:(id)sender {
    self.label.text = @"Hello, World!!";
}

- (IBAction)setNormalText:(id)sender {
    self.label.text = @"秋の田のかりほの庵の苫をあらみ　わが衣手は露にぬれつつ";
}

- (IBAction)setLongText:(id)sender {
    self.label.text = @"あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。\nまたそのなかでいっしょになったたくさんのひとたち、ファゼーロとロザーロ、羊飼のミーロや、顔の赤いこどもたち、地主のテーモ、山猫博士のボーガント・デストゥパーゴなど、いまこの暗い巨きな石の建物のなかで考えていると、みんなむかし風のなつかしい青い幻燈のように思われます。では、わたくしはいつかの小さなみだしをつけながら、しずかにあの年のイーハトーヴォの五月から十月までを書きつけましょう。";
}

@end
