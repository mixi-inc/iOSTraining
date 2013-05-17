//
//  MixiKIFTestController.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiKIFTestController.h"
#import "KIFTestScenario+MixiAdditions.h"

@implementation MixiKIFTestController
- (void)initializeScenarios
{
    [self addScenario:[KIFTestScenario myFirstScenario]];
}
@end
