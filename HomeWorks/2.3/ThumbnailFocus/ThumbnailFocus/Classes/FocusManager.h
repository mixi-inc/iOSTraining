//
//  FocusManager.h
//  ThumbnailFocus
//
//  Created by 鄭 基旭 on 2013/04/18.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FocusDelegate <NSObject>
// 全画面に表示する為には親ViewControllerのフレームを分かる必要がある。
- (UIViewController *)parentViewControllerForFocusManager;
@end


@interface FocusManager : NSObject

@property (nonatomic, assign) id<FocusDelegate> delegate;
@property (nonatomic, assign) BOOL gestureDisabledDuringZooming;

- (void)installOnView:(UIView *)view;

@end
