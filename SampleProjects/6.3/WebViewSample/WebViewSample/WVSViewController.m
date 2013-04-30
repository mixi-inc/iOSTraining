//
//  WVSViewController.m
//  WebViewSample
//
//  Created by 武田 祐一 on 2013/04/30.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "WVSViewController.h"

@interface WVSViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) UIBarButtonItem *backButton;
@property (strong, nonatomic) UIBarButtonItem *forwardButton;
@property (strong, nonatomic) UIBarButtonItem *reloadButton;

@end

@implementation WVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _webView.delegate = self;

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://mixi.jp"]];
    [_webView loadRequest:request];


    self.navigationController.toolbarHidden = NO;

    self.backButton = [[UIBarButtonItem alloc] initWithTitle:@"戻る" style:UIBarButtonItemStyleBordered target:self action:@selector(goBack)];

    self.forwardButton = [[UIBarButtonItem alloc] initWithTitle:@"進む" style:UIBarButtonItemStyleBordered target:self action:@selector(goForward)];
    self.reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"リロード" style:UIBarButtonItemStyleBordered target:self action:@selector(reload)];

    [self setToolbarItems:@[_backButton, _forwardButton, _reloadButton]];
}

- (void)goBack
{
    [_webView goBack];
}

- (void)goForward
{
    [_webView goForward];
}

- (void)reload
{
    [_webView reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    _backButton.enabled = [webView canGoBack];
    _forwardButton.enabled = [webView canGoForward];

    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = title;

}

@end
