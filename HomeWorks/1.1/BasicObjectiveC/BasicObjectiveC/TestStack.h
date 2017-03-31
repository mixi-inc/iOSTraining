//
//  TestStack.h
//  BasicObjectiveC
//
//  Created by Shuka Takakuma on 2014/06/28.
//  Copyright (c) 2014年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

/** スタック **/
@interface TestStack : NSObject

/** プッシュ **/
- (void)push:(id)object;

/** ポップ **/
- (id)pop;

/** スタックのサイズ **/
- (NSInteger)size;

@end
