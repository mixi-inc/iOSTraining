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
    // task 1-1
    NSDictionary *dict1 =
    @{
      @"domain": @"mixi.jp",
      @"entry": @[@"list_voice.pl", @"list_diary.pl", @"list_mymall_item.pl"]
      };
    NSDictionary *dict2 =
    @{
      @"domain" : @"mmall.jp",
      @"entry"  : @[
              @{
                  @"path"     : @"add_diary.pl",
                  @"query"    : @[
                          @{
                              @"tag_id"   : @7
                              }
                          ]
                  }
              ]
      };
    NSDictionary *dict3 =
    @{
      @"domain": @"itunes.apple.com",
      };
    NSArray* tree = @[dict1, dict2, dict3];
    NSLog(@"%@", tree);

    // task 1-2
    TestQueue* queue = [[TestQueue alloc] init];
    [queue push:@"aaaa"];
    [queue push:@"bbbb"];
    id q_first = [queue pop];
    id q_second = [queue pop];
    NSLog(@"%@", q_first);
    NSLog(@"%@", q_second);

    TestStack* stack = [[TestStack alloc] init];
    [stack push:@"cccc"];
    [stack push:@"dddd"];
    id s_first = [stack pop];
    id s_second = [stack pop];
    NSLog(@"%@", s_first);
    NSLog(@"%@", s_second);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
