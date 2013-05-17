//
//  MixiTimeLineModel.h
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MixiTimelineEntity.h"

@protocol MixiTimeLineModelDelegate <NSObject>

-(void) timeLineModelDidFinishLoad;
-(void) timeLineModelDidFailLoad;

@end

@interface MixiTimeLineModel : NSObject

@property (nonatomic, strong) NSMutableArray *timelineArray;
@property (nonatomic, weak) id delegate;

-(void)fetchTimelineData;

@end
