//
//  MFTModalViewController.m
//  ModalFromTab
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MFTModalViewController.h"

@interface MFTModalViewController ()

@end

@implementation MFTModalViewController

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
- (IBAction)closeButtonTapped:(id)sender {

    if (_delegate && [_delegate respondsToSelector:@selector(modalViewControllerCloseButtonTapped:)]) {
        [_delegate modalViewControllerCloseButtonTapped:self];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}

@end
