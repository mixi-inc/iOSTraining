//
//  UIView+PushBackAnimation.h
//  mixi
//
//  Created by 鄭 基旭 on 2013/04/03.
//
//

#import <UIKit/UIKit.h>

@interface UIView (PushBackAnimation)
@property (assign, nonatomic) BOOL pushBackState;

-(void) animationPopFront;
-(void) animationPushBack;

-(void) animationPopFrontScaleUp;
-(void) animationPushBackScaleDown;

@end
