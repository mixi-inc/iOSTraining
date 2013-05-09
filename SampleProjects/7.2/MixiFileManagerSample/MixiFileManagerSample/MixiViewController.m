//
//  MixiViewController.m
//  MixiFileManagerSample
//
//  Created by 田村 航弥 on 2013/05/09.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *rootURL = NSHomeDirectory();
    NSLog(@"%@", rootURL);
    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory
                                             inDomains:NSUserDomainMask];
    NSLog(@"%@", urls[0]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
