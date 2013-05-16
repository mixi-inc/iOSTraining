//
//  MixiJankenTest.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiJanken.h"

#import <Kiwi.h>

SPEC_BEGIN(janken)

describe(@"Winner", ^{

    __block MixiJankenPeople *alice;
    __block MixiJankenPeople *bob;
    __block MixiJankenPeople *winner;

    beforeAll(^{
        alice = [[MixiJankenPeople alloc] init];
        bob   = [[MixiJankenPeople alloc] init];
        winner = nil;
    });

    it(@"is even", ^{
        alice.hand = JankenHandTypePaper;
        bob.hand = JankenHandTypePaper;
        winner = [MixiJankenDecider jankenWithPeoples:@[alice, bob]];
        [winner shouldBeNil];
    });


    it(@"is alice", ^{
        alice.hand = JankenHandTypeScissors;
        bob.hand = JankenHandTypePaper;
        winner = [MixiJankenDecider jankenWithPeoples:@[alice, bob]];
        [[winner should] equal:alice];
    });

    it(@"is bob", ^{
        alice.hand = JankenHandTypeRock;
        bob.hand = JankenHandTypePaper;
        winner = [MixiJankenDecider jankenWithPeoples:@[alice, bob]];
        [[winner should] equal:bob];
    });


});

SPEC_END