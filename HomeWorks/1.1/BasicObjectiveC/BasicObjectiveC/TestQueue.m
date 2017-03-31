//
//  TestQueue.m
//  BasicObjectiveC
//
//  Created by 菅原 源一郎 on 13/04/19.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TestQueue.h"

@implementation TestQueue

-(id) init
{
    self = [super init];
    if (self)
    {
        _container = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) push:(id)object
{
    [_container addObject:object];
}

-(id) pop
{
    id result = _container[0];
    [_container removeObjectAtIndex:0];
    return result;
}

-(NSInteger) size
{
    return [_container count];
}

@end