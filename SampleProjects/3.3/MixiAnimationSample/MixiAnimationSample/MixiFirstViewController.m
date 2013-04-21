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
static CGRect const kOjisanMovedFrame = {{320, 586}, {170, 170}};

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

    [UIView animateWithDuration:4.5
                     animations:^{
                         [_ojisanImageView setFrame:kOjisanMovedFrame];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
