//
//  MixiTimelineEntity.m
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiTimelineEntity.h"

@implementation MixiTimelineEntity

-(id)initWithDict:(NSDictionary *)dict
{
    if(self=[super init]){
        _author = dict[@"author"];
        _date = dict[@"date"];
        _objectType = dict[@"object_type"];
        _text = dict[@"text"];
        _photoURL = dict[@"photo_url"];
        _photoHeight = [dict[@"photo_height"] floatValue];
    }
    return self;
}

@end
