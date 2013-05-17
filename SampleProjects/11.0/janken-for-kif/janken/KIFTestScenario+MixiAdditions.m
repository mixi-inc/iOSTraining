//
//  KIFTestScenario+MixiAdditions.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "KIFTestScenario+MixiAdditions.h"
#import "KIFTestStep+MixiAdditions.h"

@implementation KIFTestScenario (MixiAdditions)
+ (id)myFirstScenario
{
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"This is my first scenario"];
    [scenario addStep:[KIFTestStep stepToTapAliceRockButton]];
    [scenario addStep:[KIFTestStep stepToWaitForAliceLabelChanged:@"グー"]];
    return scenario;
}
@end
