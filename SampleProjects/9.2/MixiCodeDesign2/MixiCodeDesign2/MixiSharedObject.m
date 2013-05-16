//
//  MixiSharedObject.m
//  MixiCodeDesign2
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiSharedObject.h"

@implementation MixiSharedObject

+(MixiSharedObject *)sharedInstance
{
    static MixiSharedObject *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MixiSharedObject alloc] init];
    });
    return sharedInstance;
}

-(void)doSomthing
{
    //doSomething
}

@end
