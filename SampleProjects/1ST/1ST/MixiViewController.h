//
//  MixiViewController.h
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixiPostViewController.h"

@interface MixiViewController : UIViewController
<MixiPostViewControllerDelegate>

- (IBAction)pressAddButton:(id)sender;
- (IBAction)pressRemoveButton:(id)sender;
- (IBAction)pressModalButton:(id)sender;
@end
