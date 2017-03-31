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
}

@end

@implementation TestStack

- (id)init
{
    self = [super init];
    
    if (self) {
        data = [[NSMutableArray alloc] initWithCapacity:8];
    }
    
    return self;
}

/** プッシュ **/
- (void)push:(id)object
{
    [data addObject:object];
}

/** ポップ **/
- (id)pop
{
    id top = [data lastObject];
    
    [data removeLastObject];
    
    return top;
}

/** スタックのサイズ **/
- (NSInteger)size
{
    return data.count;
}

@end
