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
    NSMutableArray *datas;
    
    // スタックの最上部
    NSInteger topIndex;
}

@end

@implementation TestStack

- (id)init
{
    self = [super init];
    
    if (self) {
        datas = [[NSMutableArray alloc] initWithCapacity:8];
        topIndex = -1;
    }
    
    return self;
}

/** プッシュ **/
- (void)push:(id)object
{
    if ((++topIndex) < datas.count) {
        datas[topIndex] = object;
    }
    else {
        [datas addObject:object];
    }
}

/** ポップ **/
- (id)pop
{
    return datas[topIndex--];
}

/** スタックのサイズ **/
- (NSInteger)size
{
    return topIndex + 1;
}

@end
