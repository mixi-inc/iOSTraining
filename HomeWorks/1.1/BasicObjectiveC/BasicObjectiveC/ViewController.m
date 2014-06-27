//
//  ViewController.m
//  BasicObjectiveC
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO ここに課題を書き進めていってください

    NSArray *data = @[
                      @{
                          @"domain": @"mixi.jp",
                          @"entry": @[
                                  @"list_voice.pl",
                                  @"list_diary.pl",
                                  @"list_mymail_item.pl"
                                  ]
                          },
                      @{
                          @"domain": @"mmall.jp",
                          @"entry": @{
                                  @"path": @"add_diary.pl",
                                  @"query":
                                      @[
                                          @{@"tag_id": @7}
                                          ]
                                  }
                          },
                      @{
                          @"domain": @"itunes.apple.com"
                          }
                      ];
    
    NSLog(@"%@", data);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
