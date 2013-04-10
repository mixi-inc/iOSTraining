//
//  MixiPostViewController.m
//  1ST
//
//  Created by 田村 航弥 on 2013/04/10.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiPostViewController.h"

@interface MixiPostViewController ()

@end

@implementation MixiPostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressModalButton:(id)sender
{
    MixiLoginViewController *mixiLoginVC = [[MixiLoginViewController alloc]init];
    mixiLoginVC.delegate = self;
    [self presentViewController:mixiLoginVC animated:YES completion:nil];
}

-(IBAction)pressClosedButton:(id)sender
{
    NSLog(@"%@, %@, %@", self.presentingViewController, self.presentedViewController, self.parentViewController);
    if([_delegate respondsToSelector:@selector(didPressCloseButton)]){
        [_delegate didPressCloseButton];
    }
}

#pragma mark - MixiLoginViewControllerDelegate methods
-(void)didPressCloseButton
{
    if([_delegate respondsToSelector:@selector(didPressCloseButton)]){
        [_delegate didPressCloseButton];
    }
}

@end