//
//  TVSCustomCell.h
//  TableViewSample
//
//  Created by 武田 祐一 on 2013/04/23.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVSCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

-(CGFloat)calculateCellHeightWithText:(NSString *)text;

@end
