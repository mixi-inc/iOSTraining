//
//  TestQueue.m
//  BasicObjectiveC
//
//  Created by Shuka Takakuma on 2014/06/28.
//  Copyright (c) 2014年 武田 祐一. All rights reserved.
//

#import "TestQueue.h"

@interface TestQueue ()
{
    // データ列
    NSMutableArray *data;
    
    // キューの先頭のインデックス
    NSInteger firstIndex;
}
@end

@implementation TestQueue

- (id)init
{
    self = [super init];
    
    if (self) {
        data = [[NSMutableArray alloc] initWithCapacity:8];
        firstIndex = 0;
    }
    
    return self;
}

/** エンキュー **/
- (void)push:(id)object
{
    [data addObject:object];
}

/** デキュー **/
- (id)pop
{
    return data[firstIndex++];
}

/** キューのサイズ **/
- (NSInteger)size
{
    return data.count - firstIndex;
}

@end
