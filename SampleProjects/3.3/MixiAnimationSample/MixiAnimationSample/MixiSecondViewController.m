//
//  MixiSecondViewController.m
//  MixiAnimationSample
//
//  Created by Koya Tamura on 2013/04/22.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiSecondViewController.h"

@interface MixiSecondViewController ()

@property (strong, nonatomic) UIImageView *ojisanImageView1;
@property (strong, nonatomic) UIImageView *ojisanImageView2;

@end

static CGRect const kOjisanInitialFrame = {{85, 115}, {170, 170}};

@implementation MixiSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _ojisanImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ojisan"]];
    _ojisanImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ojisan2"]];

    [self.view addSubview:_ojisanImageView1];
    [_ojisanImageView1 setFrame:kOjisanInitialFrame];
    [self.view addSubview:_ojisanImageView2];
    [_ojisanImageView2 setFrame:kOjisanInitialFrame];
    _ojisanImageView2.hidden = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [UIView transitionWithView:self.view
                      duration:3.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        _ojisanImageView1.hidden = !_ojisanImageView1.hidden;
                        _ojisanImageView2.hidden = !_ojisanImageView2.hidden;
                    } completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
