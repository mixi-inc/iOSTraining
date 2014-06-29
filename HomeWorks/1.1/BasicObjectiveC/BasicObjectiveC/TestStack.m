//
//  TestStack.m
//  BasicObjectiveC
//
//  Created by Shuka Takakuma on 2014/06/28.
//  Copyright (c) 2014年 武田 祐一. All rights reserved.
//

#import "TestStack.h"

@interface TestStack ()
{
    // データ列
    NSMutableArray *data;
    
    // スタックの最上部
    NSInteger topIndex;
}

@end

@implementation TestStack

- (id)init
{
    self = [super init];
    
    if (self) {
        data = [[NSMutableArray alloc] initWithCapacity:8];
        topIndex = -1;
    }
    
    return self;
}

/** プッシュ **/
- (void)push:(id)object
{
    if ((++topIndex) < data.count) {
        data[topIndex] = object;
    }
    else {
        [data addObject:object];
    }
}

/** ポップ **/
- (id)pop
{
    return data[topIndex--];
}

/** スタックのサイズ **/
- (NSInteger)size
{
    return topIndex + 1;
}

@end
