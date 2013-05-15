//
//  NSDate+Day.h
//  MixiCodeDesignSample
//
//  Created by 田村 航弥 on 2013/05/14.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DayOfWeekType){
    DayOfWeekSunday = 1,
    DayOfWeekMonday,
    DayOfWeekTuseday,
    DayOfWeekWednesday,
    DayOfWeekThursday,
    DayOfWeekFriday,
    DayOfWeekSaturday
};

@interface NSDate (Day)

-(DayOfWeekType)dayOfWeekWithDate;

@end
