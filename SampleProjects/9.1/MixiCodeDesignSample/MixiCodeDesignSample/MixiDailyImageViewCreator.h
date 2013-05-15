//
//  MixiDailyImageViewCreator.h
//  MixiCodeDesignSample
//
//  Created by 田村 航弥 on 2013/05/14.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Day.h"

@interface MixiDailyImageViewCreator : NSObject

+(id)imageViewWithDayOfWeek:(DayOfWeekType)dayOfWeekType;

@end
