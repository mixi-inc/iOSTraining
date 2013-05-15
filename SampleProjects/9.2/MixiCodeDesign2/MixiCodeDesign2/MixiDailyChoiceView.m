//
//  MixiDailyChoiceView.m
//  MixiCodeDesign2
//
//  Created by 田村 航弥 on 2013/05/15.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiDailyChoiceView.h"

@implementation MixiDailyChoiceView

+(MixiDailyChoiceView *)dailyChoiceView
{
    NSArray *topLevelViews = [[NSBundle mainBundle] loadNibNamed:@"MixiDailyChoiceView"
                                                           owner:self
                                                         options:nil];
    MixiDailyChoiceView *dailyChoiceView = topLevelViews[0];
    return dailyChoiceView;
}

- (IBAction)pressYesButton:(id)sender
{
    //do something
}

- (IBAction)pressNoButton:(id)sender
{
    //do something
}

@end
