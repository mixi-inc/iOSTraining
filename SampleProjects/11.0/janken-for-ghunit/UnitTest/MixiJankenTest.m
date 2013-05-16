//
//  MixiJankenTest.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "MixiJanken.h"
@interface  MixiJankenTest : GHTestCase {}
@end

@implementation MixiJankenTest

- (void)testJankenWithPeople
{
    MixiJankenPeople *alice = [[MixiJankenPeople alloc] init];
    MixiJankenPeople *bob = [[MixiJankenPeople alloc] init];
    MixiJankenPeople *winner;

    alice.hand = JankenHandTypePaper;
    bob.hand = JankenHandTypePaper;

    winner = [MixiJankenDecider jankenWithPeoples:@[alice, bob]];
    GHAssertNil(winner, @"winner should be nil");

}


@end
