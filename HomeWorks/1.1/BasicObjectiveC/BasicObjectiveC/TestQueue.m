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
    NSMutableArray *datas;
    
    // キューの先頭のインデックス
    NSInteger firstIndex;
}
@end

@implementation TestQueue

- (id)init
{
    self = [super init];
    
    if (self) {
        datas = [[NSMutableArray alloc] initWithCapacity:8];
        firstIndex = 0;
    }
    
    return self;
}

/** エンキュー **/
- (void)push:(id)object
{
    [datas addObject:object];
}

/** デキュー **/
- (id)pop
{
    return datas[firstIndex++];
}

/** キューのサイズ **/
- (NSInteger)size
{
    return datas.count;
}

@end
