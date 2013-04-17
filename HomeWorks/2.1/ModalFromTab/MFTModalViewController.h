//
//  MFTModalViewController.h
//  ModalFromTab
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MTFModalViewControllerDelegate;

@interface MFTModalViewController : UIViewController
@property (nonatomic, weak) id<MTFModalViewControllerDelegate> delegate;
@end


@protocol MTFModalViewControllerDelegate <NSObject>
- (void)modalViewControllerCloseButtonTapped:(MFTModalViewController *)viewController;
@end
