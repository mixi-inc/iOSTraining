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
    NSLog(@"%d", [queue size]);
    [queue enqueue:@"Queue Data1"];
    NSLog(@"%d", [queue size]);
    [queue enqueue:@"Queue Data2"];
    NSLog(@"%d", [queue size]);
    NSLog(@"%@", [queue dequeue]);
    NSLog(@"%d", [queue size]);
    [queue enqueue:@"Queue Data3"];
    NSLog(@"%d", [queue size]);
    [queue enqueue:@"Queue Data4"];
    NSLog(@"%d", [queue size]);
    NSLog(@"%@", [queue dequeue]);
    NSLog(@"%d", [queue size]);
    NSLog(@"%@", [queue dequeue]);
    NSLog(@"%d", [queue size]);
    [queue enqueue:@"Queue Data5"];
    NSLog(@"%d", [queue size]);
    NSLog(@"%@", [queue dequeue]);
    NSLog(@"%d", [queue size]);
    NSLog(@"%@", [queue dequeue]);
    NSLog(@"%d", [queue size]);
    
    // スタック
    TestStack *stack = [[TestStack alloc] init];
    NSLog(@"%d", [stack size]);
    [stack push:@"Stack Data1"];
    NSLog(@"%d", [stack size]);
    [stack push:@"Stack Data2"];
    NSLog(@"%d", [stack size]);
    NSLog(@"%@", [stack pop]);
    NSLog(@"%d", [stack size]);
    [stack push:@"Stack Data3"];
    NSLog(@"%d", [stack size]);
    [stack push:@"Stack Data4"];
    NSLog(@"%d", [stack size]);
    NSLog(@"%@", [stack pop]);
    NSLog(@"%d", [stack size]);
    NSLog(@"%@", [stack pop]);
    NSLog(@"%d", [stack size]);
    [stack push:@"Stack Data5"];
    NSLog(@"%d", [stack size]);
    NSLog(@"%@", [stack pop]);
    NSLog(@"%d", [stack size]);
    NSLog(@"%@", [stack pop]);
    NSLog(@"%d", [stack size]);
    // ----------------------------------------------------
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
