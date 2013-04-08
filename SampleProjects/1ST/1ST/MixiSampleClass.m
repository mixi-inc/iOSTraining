//
//  MixiSampleClass.m
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiSampleClass.h"

@implementation MixiSampleClass

-(id)initWithName:(NSString *)name
{
    self = [super init];
    if(self){
        _name = name;
    }
    return self;
}

+ (NSString *)getClassName
{
    return @"MixiSampleClass";
}
@end
