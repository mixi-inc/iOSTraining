//
//  MixiTimeLineModel.m
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiTimeLineModel.h"


@implementation MixiTimeLineModel

-(void)fetchTimelineData
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://raw.github.com/mixi-inc/iOSTraining/master/SampleData/9.3/timeline.json"]];

    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:backgroundQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if(error){
                                   if([_delegate respondsToSelector:@selector(timeLineModelDidFailLoad)]){
                                       [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                           [_delegate timeLineModelDidFailLoad];
                                       }];

                                   }
                                   return;
                               }

                               NSError *jsonSerializationError = nil;
                               NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:NSJSONReadingAllowFragments
                                                                                      error:&jsonSerializationError];

                               _timelineArray = [NSMutableArray array];
                               for (NSDictionary *dict in dataArray){
                                   [_timelineArray addObject:[[MixiTimelineEntity alloc] initWithDict:dict]];
                               }

                               if([_delegate respondsToSelector:@selector(timeLineModelDidFinishLoad)]){
                                   [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                       [_delegate timeLineModelDidFinishLoad];
                                   }];
                               }
                           }];
}

@end
