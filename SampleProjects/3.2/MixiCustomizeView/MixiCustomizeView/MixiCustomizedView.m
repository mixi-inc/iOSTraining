//
//  MixiCustomizedView.m
//  MixiCustomizeView
//
//  Created by Koya Tamura on 2013/04/21.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiCustomizedView.h"

@implementation MixiCustomizedView

static CGRect const kSubViewFrame = {{10, 10}, {300, 180}};
static CGRect const kButtonFrame = {{10, 10}, {220, 30}};

// コードで初期化する場合
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initializeView];
    }
    return self;
}

// xib を使用する場合
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self initializeView];
    }
    return self;
}

-(void)initializeView
{
    [self setBackgroundColor:[UIColor greenColor]];

    UIView *subView = [[UIView alloc] initWithFrame:kSubViewFrame];
    [subView setBackgroundColor:[UIColor redColor]];
    [self addSubview:subView];

    UILabel *label = [[UILabel alloc] initWithFrame:kButtonFrame];
    label.text = @"hogehoge";
    label.backgroundColor = [UIColor clearColor];
    [subView addSubview:label];
}

@end
