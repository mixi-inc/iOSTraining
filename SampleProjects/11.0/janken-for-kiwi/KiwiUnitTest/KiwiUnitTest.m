//
//  KiwiUnitTest.m
//  KiwiUnitTest
//
//  Created by 武田 祐一 on 2013/05/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//


#import <Kiwi.h>


SPEC_BEGIN(MyFirstSpec)
describe(@"Math", ^{
    it(@"is pretty cool", ^{
        NSUInteger a = 100;
        NSUInteger b = 200;
        [[theValue(a + b) should] equal:theValue(300)];
    });
});
SPEC_END

