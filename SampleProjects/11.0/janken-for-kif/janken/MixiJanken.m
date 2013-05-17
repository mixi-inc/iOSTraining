//
//  MixiJanken.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiJanken.h"

@implementation MixiJankenPeople

@end

@implementation MixiJankenDecider

+ (MixiJankenPeople *)jankenWithPeoples:(NSArray *)peoples
{
    MixiJankenPeople *alice = peoples[0];
    MixiJankenPeople *bob   = peoples[1];

    if (alice.hand == bob.hand) {
        return nil;
    }

    if ([MixiJankenDecider aliceWins:alice toBob:bob]) {
        return alice;
    } else {
        return bob;
    }
}


+ (BOOL)aliceWins:(MixiJankenPeople *)alice toBob:(MixiJankenPeople *)bob
{
    if (alice.hand == JankenHandTypePaper     && bob.hand == JankenHandTypeRock    ) return YES;
    if (alice.hand == JankenHandTypeRock      && bob.hand == JankenHandTypeScissors) return YES;
    if (alice.hand == JankenHandTypeScissors  && bob.hand == JankenHandTypePaper   ) return YES;
    return NO;
}


@end