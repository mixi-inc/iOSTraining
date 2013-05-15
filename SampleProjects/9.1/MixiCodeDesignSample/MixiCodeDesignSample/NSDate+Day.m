//
//  NSDate+Day.m
//  MixiCodeDesignSample
//
//  Created by 田村 航弥 on 2013/05/14.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "NSDate+Day.h"

@implementation NSDate (Day)

-(DayOfWeekType)dayOfWeekWithDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents = [gregorianCalendar components:(NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:self];
    NSInteger day = [weekdayComponents weekday];
    return day;
}

@end
