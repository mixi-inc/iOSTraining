//
//  FocusManager.m
//  ThumbnailFocus
//
//  Created by 鄭 基旭 on 2013/04/18.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "FocusManager.h"
#import "FocusViewController.h"
#import "ImageScrollView.h"

static CGFloat const kAnimateElasticSizeRatio = 0.03;
static CGFloat const kAnimationDuration = 0.5;

@interface FocusManager ()
@property (nonatomic, weak) UIView *mediaView;
@property (nonatomic, strong) FocusViewController *focusViewController;
@property (nonatomic, assign) BOOL isZooming;
@end

@implementation FocusManager

- (id)init
{
    self = [super init];
    if(self) {
        self.isZooming = NO;
        self.gestureDisabledDuringZooming = YES;
    }
    return self;
}

- (void)installOnView:(UIView *)view
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleFocusGesture:)];
    [view addGestureRecognizer:tapGesture];
    view.userInteractionEnabled = YES;
}

- (FocusViewController *)focusViewControllerForView:(UIView *)mediaView
{
    UIImage *image = ((UIImageView *)mediaView).image;
    if(image == nil) return nil;

    FocusViewController *viewController = [[FocusViewController alloc] initWithNibName:@"FocusViewController"
                                                                                bundle:nil];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleDefocusGesture:)];
    [viewController.view addGestureRecognizer:tapGesture];
    viewController.mainImageView.image = image;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%df.jpg", mediaView.tag]];
        viewController.mainImageView.image = [self decodedImageWithImage:image];
    });
    return viewController;
}

- (void)handleFocusGesture:(UIGestureRecognizer *)gesture
{
    FocusViewController *focusViewController = [self focusViewControllerForView:gesture.view];
    if(focusViewController == nil) return;
    
    self.focusViewController = focusViewController;
    self.mediaView = gesture.view;
    UIViewController *parentViewController = [self.delegate parentViewControllerForFocusManager];
    [parentViewController addChildViewController:focusViewController];
    [parentViewController.view addSubview:focusViewController.view];
    focusViewController.view.frame = parentViewController.view.bounds;
    _mediaView.hidden = YES;
    
    UIView *imageView = focusViewController.mainImageView;
    CGPoint center = [imageView.superview convertPoint:_mediaView.center fromView:_mediaView.superview];
    imageView.center = center;
    imageView.bounds = _mediaView.bounds;
    
    self.isZooming = YES;
#warning ★HomeWork：余裕がある方はZoomアニメーションも作って見てみてください。
    [UIView animateWithDuration:kAnimationDuration
                     animations:^{
                         focusViewController.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
                     }
                     completion:^(BOOL finished) {
                             [self installZoomView];
                             self.isZooming = NO;                         
                     }];
}

- (void)installZoomView
{
    ImageScrollView *scrollView = [[ImageScrollView alloc] initWithFrame:self.focusViewController.contentView.bounds];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.focusViewController.scrollView = scrollView;
    [self.focusViewController.contentView addSubview:scrollView];
    [scrollView displayImage:self.focusViewController.mainImageView.image];
    self.focusViewController.mainImageView.hidden = YES;
}

- (void)uninstallZoomView
{
    UIView *contentView = self.focusViewController.contentView;
    CGRect frame = [contentView convertRect:self.focusViewController.scrollView.zoomImageView.frame
                                   fromView:self.focusViewController.scrollView];
    self.focusViewController.scrollView.hidden = YES;
    self.focusViewController.mainImageView.hidden = NO;
    self.focusViewController.mainImageView.frame = frame;
}

- (void)handleDefocusGesture:(UIGestureRecognizer *)gesture
{
    if(self.isZooming && self.gestureDisabledDuringZooming) return;

    [self uninstallZoomView];

    UIView *contentView = self.focusViewController.mainImageView;
    CGFloat dx = self.mediaView.frame.size.width * kAnimateElasticSizeRatio;
    CGFloat dy = self.mediaView.frame.size.height* kAnimateElasticSizeRatio;

    [UIView animateWithDuration:kAnimationDuration
                     animations:^{
                         self.focusViewController.contentView.transform = CGAffineTransformIdentity;
                         contentView.center = [contentView.superview convertPoint:self.mediaView.center fromView:self.mediaView.superview];
                         contentView.bounds = CGRectInset(self.mediaView.frame, dx, dy);
                         gesture.view.backgroundColor = [UIColor clearColor];
                     }
                     completion:^(BOOL finished) {
                         self.mediaView.hidden = NO;
                         [self.focusViewController.view removeFromSuperview];
                         [self.focusViewController removeFromParentViewController];
                         self.focusViewController = nil;
                     }];
}



////////////////////////////////////////////////////////////////////////////////////////////////////
// Taken from https://github.com/rs/SDWebImage/blob/master/SDWebImage/SDWebImageDecoder.m
////////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage *)decodedImageWithImage:(UIImage *)image
{
    CGImageRef imageRef = image.CGImage;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    CGRect imageRect = (CGRect){.origin = CGPointZero, .size = imageSize};

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, imageSize.width, imageSize.height, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpace, CGImageGetBitmapInfo(imageRef));
    CGColorSpaceRelease(colorSpace);

    // If failed, return undecompressed image
    if (!context) return image;

    CGContextDrawImage(context, imageRect, imageRef);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);

    CGContextRelease(context);

    UIImage *decompressedImage = [UIImage imageWithCGImage:decompressedImageRef];
    CGImageRelease(decompressedImageRef);
    return decompressedImage;
}

@end
