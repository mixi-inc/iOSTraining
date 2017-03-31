//
//  SVSViewController.m
//  scrollViewSample
//
//  Created by 武田 祐一 on 2013/04/19.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "SVSViewController.h"

@interface SVSViewController ()

@end

@implementation SVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // scrollViewの準備
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;

    // imageViewの準備
    UIImage *image = [UIImage imageNamed:@"big_image.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;

    // imageViewのサイズを教えてスクロールする領域を決定する
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.frame.size;

    scrollView.maximumZoomScale = 3.0; // 最大倍率
    scrollView.minimumZoomScale = 0.5; // 最小倍率

    // HomeWork: 起動時に、アニメーション付きで自動的にあるポジションへ移動させてください。
    float scale = scrollView.zoomScale;
    CGRect rect = CGRectMake( 100, 200, 400, 400 );
    [scrollView zoomToRect:rect animated:YES];
    [scrollView setZoomScale:scale];    // スケールを再指定
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    for (UIView *view in scrollView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            return view;
        }
    }
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"スクロールされました！");
}

@end
