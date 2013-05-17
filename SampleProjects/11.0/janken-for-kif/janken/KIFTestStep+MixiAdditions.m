//
//  KIFTestStep+MixiAdditions.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "KIFTestStep+MixiAdditions.h"
#import <UIApplication-KIFAdditions.h>
#import <UIAccessibilityElement-KIFAdditions.h>

@implementation KIFTestStep (MixiAdditions)
+ (id)stepToTapAliceRockButton
{
    return [KIFTestStep stepToTapViewWithAccessibilityLabel:@"alice_rock"];
}

+ (id)stepToWaitForAliceLabelChanged:(NSString *)expectedString
{
    return [KIFTestStep stepWithDescription:@"aliceの手のラベルが変化した" executionBlock:^KIFTestStepResult(KIFTestStep *step, NSError *__autoreleasing *error) {

        UIAccessibilityElement *elem = [[UIApplication sharedApplication] accessibilityElementWithLabel:@"alice_hand"];
        UILabel *label = (UILabel *)[UIAccessibilityElement viewContainingAccessibilityElement:elem];

        if ([label.text isEqualToString:expectedString]) {
            return KIFTestStepResultSuccess;
        } else {
            return KIFTestStepResultFailure;
        }

    }];
}

@end
