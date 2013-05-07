//
//  MixiViewController.h
//  MixiAssetsLibrarySample
//
//  Created by 田村 航弥 on 2013/04/30.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixiAssetsViewController.h"

@interface MixiViewController : UIViewController
<MixiAssetsViewControllerDelegate,
UITableViewDataSource,
UITableViewDelegate>

@end