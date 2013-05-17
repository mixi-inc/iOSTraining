//
//  MixiTimelinePhotoCell.m
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiTimelinePhotoCell.h"

@interface MixiTimelinePhotoCell()

@property (nonatomic, weak) IBOutlet UIImageView *iamgeView;

@end

@implementation MixiTimelinePhotoCell

-(void)composeUIWithEntity:(MixiTimelineEntity *)entity
{
    self.authorLabel.text = entity.author;
    self.dateLabel.text = entity.date;

    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:entity.photoURL]];
    [NSURLConnection sendAsynchronousRequest:imageRequest
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *responce, NSData *data, NSError *error) {
                               [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                   [_iamgeView setImage:[UIImage imageWithData:data]];
                               }];
                           }];
}

@end
