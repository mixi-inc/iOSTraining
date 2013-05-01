//
//  MixiViewController.m
//  MixiKeyboardNotificationSample
//
//  Created by 田村 航弥 on 2013/05/01.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"keyboard hide" style:UIBarButtonItemStylePlain target:self action:@selector(hideKeyboard)];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - keyboardNotification
-(void)keyboardWillShow:(NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
    NSDictionary *userinfo = [notification userInfo];
    CGRect keyboardFrame = [userinfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect textViewFrame = {{0,0},{_textView.frame.size.width, self.view.frame.size.height - keyboardFrame.size.height}};
    [_textView setFrame:textViewFrame];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
    CGRect textViewFrame = {{0,0},{_textView.frame.size.width, self.view.frame.size.height}};
    [_textView setFrame:textViewFrame];
}

#pragma mark - private methods
-(void)hideKeyboard
{
    [_textView resignFirstResponder];
}

@end
