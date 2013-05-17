//
//  MixiTimelineCellHeightCalculator.h
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/17.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MixiTimelineEntity.h"

@interface MixiTimelineCellHeightCalculator : NSObject

+(CGFloat)calculateCellHeightWithTimelineEntity:(MixiTimelineEntity *)entity;

@end
