//
//  MixiDailyChoiceView.m
//  MixiCodeDesign2
//
//  Created by 田村 航弥 on 2013/05/15.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiDailyChoiceView.h"

@implementation MixiDailyChoiceView

+(MixiDailyView *)dailyView
{
    NSArray *topLevelViews = [[NSBundle mainBundle] loadNibNamed:@"MixiDailyChoiceView"
                                                           owner:self
                                                         options:nil];
    MixiDailyChoiceView *dailyChoiceView = topLevelViews[0];
    return dailyChoiceView;
}

- (IBAction)pressYesButton:(id)sender
{
    if([self.delegate respondsToSelector:@selector(dailyViewDidPressYesButton)]){
        [self.delegate dailyViewDidPressYesButton];
    }
}

- (IBAction)pressNoButton:(id)sender
{
    if([self.delegate respondsToSelector:@selector(dailyViewDidPressNoButton)]){
        [self.delegate dailyViewDidPressNoButton];
    }
}

@end
