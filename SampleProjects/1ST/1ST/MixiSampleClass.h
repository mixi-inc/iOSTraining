//
//  MixiSampleClass.h
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>

// [1] 列挙型
typedef NS_ENUM(NSInteger, SampleType){
    SampleTypeHoge = 0,
    SampleTypeFuga,
    SampleTypePiyo
};

@interface MixiSampleClass : NSObject

@property (nonatomic, strong) NSString *name; //[2] property

-(id)initWithName:(NSString *)name sampleType:(SampleType)sampleType; //[3] instance method
+(NSString *) getStaticString; //[4] class method

@end
