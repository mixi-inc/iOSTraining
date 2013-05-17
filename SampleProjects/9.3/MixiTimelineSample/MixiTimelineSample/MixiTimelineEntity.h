//
//  MixiTimelineEntity.h
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixiTimelineEntity : NSObject

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *objectType;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *photoURL;
@property (nonatomic, assign) CGFloat photoHeight;

-(id)initWithDict:(NSDictionary *)dict;

@end
