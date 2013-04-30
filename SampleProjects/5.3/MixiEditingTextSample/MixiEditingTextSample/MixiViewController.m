//
//  MixiViewController.m
//  MixiEditingTextSample
//
//  Created by 田村 航弥 on 2013/04/30.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *textFieldCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *textViewCountLabel;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextField:nil];
    [self setTextView:nil];
    [self setTextFieldCountLabel:nil];
    [self setTextViewCountLabel:nil];
    [super viewDidUnload];
}


@end
