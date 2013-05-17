//
//  MixiTimelineCell.h
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixiTimelineEntity.h"

@interface MixiTimelineCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

-(void)composeUIWithEntity:(MixiTimelineEntity *)entity;

@end
