//
//  MixiSampleClass.h
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixiSampleClass : NSObject

@property (nonatomic, strong) NSString *name;

-(id)initWithName:(NSString *)name;
+(NSString *) getClassName;

@end
