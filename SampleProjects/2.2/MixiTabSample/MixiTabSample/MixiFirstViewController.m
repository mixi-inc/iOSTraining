//
//  MixiFirstViewController.m
//  MixiTabSample
//
//  Created by 田村 航弥 on 2013/04/11.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiFirstViewController.h"

@interface MixiFirstViewController ()

@end

@implementation MixiFirstViewController

-(id)initWithImageName:(NSString *)imageNmae;
{
    self = [super initWithNibName:@"MixiFirstViewController" bundle:nil];
    if (self) {
        self.title = imageNmae;
        self.tabBarItem.image = [UIImage imageNamed:imageNmae];
    }
    return self;
}
							
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

@end
