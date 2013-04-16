//
//  NSString+HogeAddition.m
//  1ST
//
//  Created by 田村 航弥 on 2013/04/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "NSString+HogeAddition.h"

@implementation NSString (HogeAddition)

-(NSString *)addHoge
{
    return [NSString stringWithFormat:@"%@hoge", self];
}

@end
