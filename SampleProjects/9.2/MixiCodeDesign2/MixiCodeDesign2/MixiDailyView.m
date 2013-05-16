//
//  MixiDailyAbstractView.m
//  MixiCodeDesign2
//
//  Created by 田村 航弥 on 2013/05/15.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiDailyView.h"

@implementation MixiDailyView


-(void)pressCloseButton:(id)sender
{
    if ([_delegate respondsToSelector:@selector(dailyViewDidPressCloseButton)]) {
        [_delegate dailyViewDidPressCloseButton];
    }
}

@end
