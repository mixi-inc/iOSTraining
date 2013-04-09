//
//  MixiSampleClass.m
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiSampleClass.h"

static NSString *const constString = @"const"; // [5]クラス定数
static NSString *staticString = @"static"; // [6]クラス変数

// [7] 無名カテゴリ
@interface MixiSampleClass()

@property (nonatomic, assign) BOOL isEnabled;
@property (nonatomic, assign) SampleType sampleType;

@end

@implementation MixiSampleClass

-(id)initWithName:(NSString *)name
       sampleType:(SampleType)sampleType
{
    self = [super init];
    if(self){
        _name = name; //[8] access iVar

        _isEnabled = YES;
        _sampleType = sampleType;
    }
    return self;
}

+ (NSString *)getStaticString
{
    return staticString;
}
@end
