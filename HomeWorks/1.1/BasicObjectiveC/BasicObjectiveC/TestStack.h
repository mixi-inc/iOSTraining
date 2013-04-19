//
//  TestStack.h
//  BasicObjectiveC
//
//  Created by 菅原 源一郎 on 13/04/19.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestStack : NSObject

@property (nonatomic, strong) NSMutableArray* container;

- (id) init;
- (void) push:(id)object;
- (id) pop;
- (NSInteger) size;

@end