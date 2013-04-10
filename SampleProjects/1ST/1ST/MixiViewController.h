//
//  MixiViewController.h
//  1ST
//
//  Created by 田村 航弥 on 2013/04/05.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixiChildViewController.h"

@interface MixiViewController : UIViewController <MixiChildViewControllerDelegate> // [4] protocol の採用

- (IBAction)pressAddButton:(id)sender;
- (IBAction)pressRemoveButton:(id)sender;
- (IBAction)pressModalButton:(id)sender;
@end
