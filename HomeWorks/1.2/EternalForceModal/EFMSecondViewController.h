//
//  EFMSecondViewController.h
//  EternalForceModal
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO
// delegateのためのプロトコルを定義
@protocol EMFSecondViewControllerDelegate <NSObject>

// ここにDelegateメソッドの定義

@end


@interface EFMSecondViewController : UIViewController
@property (nonatomic, weak) id<EMFSecondViewControllerDelegate> delegate;
@end
