//
//  MixiTimelineTextCell.m
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiTimelineTextCell.h"

@interface MixiTimelineTextCell()

@property (nonatomic, weak) IBOutlet UILabel *mainTextLabel;

@end

@implementation MixiTimelineTextCell

-(void)composeUIWithEntity:(MixiTimelineEntity *)entity
{
    self.authorLabel.text = entity.author;
    self.dateLabel.text = entity.date;
    _mainTextLabel.text = entity.text;
    [_mainTextLabel sizeToFit];
}


@end
