//
//  MixiCustomizedView2.m
//  MixiCustomizeView
//
//  Created by Koya Tamura on 2013/04/21.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiCustomizedView2.h"

@interface MixiCustomizedView2()

@end

@implementation MixiCustomizedView2

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        NSArray *topLevelViews = [[NSBundle mainBundle] loadNibNamed:@"MixiCustomizedView2"
                                                               owner:self
                                                             options:nil];
        UIView* customizedView2 = topLevelViews[0];
        [self addSubview:customizedView2];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        //xib ファイルのトップレベルオブジェクトを格納した array を返す
        NSArray *topLevelViews = [[NSBundle mainBundle] loadNibNamed:@"MixiCustomizedView2"
                                                                 owner:self
                                                               options:nil];
        UIView* customizedView2 = topLevelViews[0];
        [self addSubview:customizedView2];
    }
    return self;
}

@end
