//
//  MixiJanken.h
//  janken
//
//  Created by 武田 祐一 on 2013/05/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JankenHandType)
{
    JankenHandTypeRock,
    JankenHandTypeScissors,
    JankenHandTypePaper,
    JankenHandTypeUnknown,
};

@interface MixiJankenPeople : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) JankenHandType hand;
@end


@interface MixiJankenDecider : NSObject
// じゃんけんをして、勝者を返す
// あいこの場合はnilを返す
// peoplesにはJankenPeopleを仮定しており、２人までしか対応していない
+ (MixiJankenPeople *)jankenWithPeoples:(NSArray *)peoples;
@end

