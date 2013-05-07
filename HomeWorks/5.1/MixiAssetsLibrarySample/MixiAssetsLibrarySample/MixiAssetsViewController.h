//
//  MixiAssetsViewController.h
//  MixiAssetsLibrarySample
//
//  Created by 田村 航弥 on 2013/04/30.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@protocol MixiAssetsViewControllerDelegate <NSObject>

-(void)assetsViewControllerDidSelectedPhotos:(NSArray*)assets;

@end

@interface MixiAssetsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

-(id)initWithAssetsGroup:(ALAssetsGroup *)assetsGroup;

@property (nonatomic, weak) id delegate;

@end
