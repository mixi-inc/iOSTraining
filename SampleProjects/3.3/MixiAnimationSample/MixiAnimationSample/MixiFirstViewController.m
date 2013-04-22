//
//  MixiFirstViewController.m
//  MixiAnimationSample
//
//  Created by Koya Tamura on 2013/04/22.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiFirstViewController.h"

@interface MixiFirstViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ojisanImageView;
@end

static CGRect const kOjisanInitialFrame = {{0, 0}, {170, 170}};
static CGRect const kOjisanMovedFrame = {{150, 416}, {170, 170}};

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
//    [UIView animateWithDuration:4.5
//                     animations:^{
//                         [_ojisanImageView setFrame:kOjisanMovedFrame];
//                     }];

    [UIView animateWithDuration:1.5f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [_ojisanImageView setFrame:kOjisanMovedFrame];
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.5f animations:^{
                             [_ojisanImageView setFrame:kOjisanInitialFrame];
                         }];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
