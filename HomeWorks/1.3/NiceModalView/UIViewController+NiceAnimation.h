//
//  UIView+PushBackAnimation.h
//  mixi
//
//  Created by 鄭 基旭 on 2013/04/15.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (NiceAnimation)
@property (assign, nonatomic) BOOL pushBackState;

// sample1
-(void) animationPopFront;
-(void) animationPushBack;

// sample2
-(void) animationPopFrontScaleUp;
-(void) animationPushBackScaleDown;

// TODO
-(void) animationPushBackLikeGmail;
-(void) animationPopFrontLikeGmail;

// TODO some animations...
@end