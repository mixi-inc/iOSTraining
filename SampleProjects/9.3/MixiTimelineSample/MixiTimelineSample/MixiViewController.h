//
//  MixiViewController.h
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/13.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixiTimeLineModel.h"

@interface MixiViewController : UIViewController<
MixiTimeLineModelDelegate,
UITableViewDataSource,
UITableViewDelegate>

@end
