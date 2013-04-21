//
//  MixiFirstViewController.m
//  MixiCoreAnimationSample
//
//  Created by Koya Tamura on 2013/04/22.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiFirstViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MixiFirstViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ojisanImageView;
@property (weak, nonatomic) IBOutlet UIView *subView;

@end

@implementation MixiFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _subView.layer.backgroundColor = [UIColor orangeColor].CGColor;
    _subView.layer.cornerRadius = 20.0;

    CABasicAnimation *flip = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    flip.toValue = [NSNumber numberWithDouble:M_PI * 2];
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0f/1000.f;
    perspective = CATransform3DRotate(perspective, 0, 0, 1, 0);
    _ojisanImageView.layer.transform = perspective;

    flip.duration = 2.0;
    flip.autoreverses = NO;
    flip.repeatCount = 6;

    [self.ojisanImageView.layer addAnimation:flip forKey:@"flip"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
