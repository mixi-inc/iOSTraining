//
//  TestQueue.h
//  BasicObjectiveC
//
//  Created by Shuka Takakuma on 2014/06/28.
//  Copyright (c) 2014年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

/** キュー **/
@interface TestQueue : NSObject

/** エンキュー **/
- (void)enqueue:(id)object;

/** デキュー **/
- (id)dequeue;

/** キューのサイズ **/
- (NSInteger)size;

@end
