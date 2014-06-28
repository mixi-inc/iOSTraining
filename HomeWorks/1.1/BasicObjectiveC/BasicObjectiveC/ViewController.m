//
//  ViewController.m
//  BasicObjectiveC
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "ViewController.h"
#import "TestQueue.h"
#import "TestStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO ここに課題を書き進めていってください

    // 課題1 -----------------------------------------------
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
    // ----------------------------------------------------
    
    // 課題2 -----------------------------------------------
    // キュー
    TestQueue *queue = [[TestQueue alloc] init];
    [queue push:@"Queue Data1"];
    [queue push:@"Queue Data2"];
    NSLog(@"%@", [queue pop]);
    [queue push:@"Queue Data3"];
    [queue push:@"Queue Data4"];
    NSLog(@"%@", [queue pop]);
    NSLog(@"%@", [queue pop]);
    [queue push:@"Queue Data5"];
    NSLog(@"%@", [queue pop]);
    NSLog(@"%@", [queue pop]);
    
    // スタック
    TestStack *stack = [[TestStack alloc] init];
    [stack push:@"Stack Data1"];
    [stack push:@"Stack Data2"];
    NSLog(@"%@", [stack pop]);
    [stack push:@"Stack Data3"];
    [stack push:@"Stack Data4"];
    NSLog(@"%@", [stack pop]);
    NSLog(@"%@", [stack pop]);
    [stack push:@"Stack Data5"];
    NSLog(@"%@", [stack pop]);
    NSLog(@"%@", [stack pop]);
    // ----------------------------------------------------
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
