//
//  KIFTestStep+MixiAdditions.h
//  janken
//
//  Created by 武田 祐一 on 2013/05/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "KIFTestStep.h"

@interface KIFTestStep (MixiAdditions)
+ (id)stepToTapAliceRockButton;
+ (id)stepToWaitForAliceLabelChanged:(NSString *)expectedString;
@end
