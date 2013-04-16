//
//  UIViewController+NiceAnimation.h
//  mixi
//
//  Created by 鄭 基旭 on 2013/04/15.
//
//

#import "UIViewController+NiceAnimation.h"
#import <QuartzCore/QuartzCore.h>

static NSMutableDictionary* sharedDictionary = nil;
@implementation UIViewController (NiceAnimation)
+(NSMutableDictionary*) niceStateDictionary {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedDictionary = [[NSMutableDictionary alloc] init];
	});
	return sharedDictionary;
}

-(NSString*) _hashKey {
	return [NSString stringWithFormat:@"%p", self];
}

-(BOOL) pushBackState {
	NSMutableDictionary* dictionary = [[self class] niceStateDictionary];
	NSString* key = [self _hashKey];
	return [[dictionary objectForKey:key] boolValue];
}

-(void) setPushBackState:(BOOL)pushBackState {
	NSMutableDictionary* dictionary = [[self class] niceStateDictionary];
	NSString* key = [self _hashKey];
	if(pushBackState) {
		[dictionary setObject:[NSNumber numberWithBool:pushBackState] forKey:key];
	} else {
		[dictionary removeObjectForKey:key];
	}
}

-(BOOL) _hasFourInchDisplay {
	return ([UIScreen mainScreen].bounds.size.height==568 || [UIScreen mainScreen].bounds.size.width==568);
}

#pragma mark - public methods
-(void) animationPopFront {
	if(self.pushBackState == NO) return;
	CATransform3D abc = CATransform3DIdentity;
	abc.m24 = -0.0005;
	UIView* view = self.navigationController.view?self.navigationController.view:self.view;
	view.frame = CGRectMake(0, 0, 320, [self _hasFourInchDisplay]?568:480);
	view.layer.transform = abc;
	[UIView animateWithDuration:0.3 animations:^{
		view.alpha = 1;
		view.layer.transform = CATransform3DIdentity;
	}];
	
	self.pushBackState = NO;
}

-(void) animationPushBack {
	CATransform3D abc = CATransform3DIdentity;
//	abc.m24 = -0.0002;
	abc.m24 = -0.001;
	abc.m44 = 1.05;
	
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//	animation.duration = 0.3;
	animation.toValue = [NSValue valueWithCATransform3D:abc];
	animation.removedOnCompletion = YES;
	
	
	UIBezierPath *movePath = [UIBezierPath bezierPath];
	//	movePath add
	[movePath moveToPoint:self.view.center];
	[movePath addLineToPoint:CGPointMake(self.view.center.x, self.view.center.y+10)];
	[movePath addLineToPoint:CGPointMake(self.view.center.x, self.view.center.y-50)];
	
	CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	moveAnim.path = movePath.CGPath;
	moveAnim.removedOnCompletion = YES;
	
	CABasicAnimation* alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
	alpha.toValue = [NSNumber numberWithFloat:0.1];
	alpha.removedOnCompletion = YES;
	
	CAAnimationGroup* group = [CAAnimationGroup animation];
	group.duration = 0.3;
	group.animations = [NSArray arrayWithObjects:animation, moveAnim, alpha, nil];
	
	UIView* view = self.navigationController.view?self.navigationController.view:self.view;
	[view.layer addAnimation:group forKey:nil];

	self.pushBackState = YES;
}

#define HC_DEFINE_TO_SCALE (CATransform3DMakeScale(0.95, 0.95, 0.95))
#define HC_DEFINE_TO_OPACITY (0.4f)

-(void) animationPopFrontScaleUp {
	if(self.pushBackState == NO) return;
	CABasicAnimation* scaleUp = [CABasicAnimation animationWithKeyPath:@"transform"];
	scaleUp.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
	scaleUp.fromValue = [NSValue valueWithCATransform3D:HC_DEFINE_TO_SCALE];
	scaleUp.removedOnCompletion = YES;
	
	CABasicAnimation* opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
	opacity.fromValue = [NSNumber numberWithFloat:HC_DEFINE_TO_OPACITY];
	opacity.toValue = [NSNumber numberWithFloat:1.0f];
	opacity.removedOnCompletion = YES;
	
	CAAnimationGroup* group = [CAAnimationGroup animation];
	group.duration = 0.4;
	group.animations = [NSArray arrayWithObjects:scaleUp, opacity, nil];
	
	UIView* view = self.navigationController.view?self.navigationController.view:self.view;
	[view.layer addAnimation:group forKey:nil];
	
	self.pushBackState = NO;
}

-(void) animationPushBackScaleDown {
	CABasicAnimation* scaleDown = [CABasicAnimation animationWithKeyPath:@"transform"];
	scaleDown.toValue = [NSValue valueWithCATransform3D:HC_DEFINE_TO_SCALE];
	scaleDown.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
	scaleDown.removedOnCompletion = YES;
	
	CABasicAnimation* opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
	opacity.fromValue = [NSNumber numberWithFloat:1.0f];
	opacity.toValue = [NSNumber numberWithFloat:HC_DEFINE_TO_OPACITY];
	opacity.removedOnCompletion = YES;
	
	CAAnimationGroup* group = [CAAnimationGroup animation];
	group.duration = 0.4;
	group.animations = [NSArray arrayWithObjects:scaleDown, opacity, nil];
	
	UIView* view = self.navigationController.view?self.navigationController.view:self.view;
	[view.layer addAnimation:group forKey:nil];
	
	self.pushBackState = YES;
}


#pragma TODO: 公式Gmailアプリの設定ボタンをタップしてみて同じように作ってみましょう（まだはできなくても構いませんので、上の関数を参考して挑戦してみましょう）
-(void) animationPushBackLikeGmail {
	/*
	 TODO:
	 */
	
	self.pushBackState = YES;
}

-(void) animationPopFrontLikeGmail {
	if(self.pushBackState == NO) return;
	
	/*
	 TODO:
	 */
	
	self.pushBackState = NO;
}
@end