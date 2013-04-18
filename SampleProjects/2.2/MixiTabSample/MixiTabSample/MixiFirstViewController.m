//
//  MixiFirstViewController.m
//  MixiTabSample
//
//  Created by 田村 航弥 on 2013/04/11.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiFirstViewController.h"
#import "MixiSecondViewController.h"

@interface MixiFirstViewController ()
- (IBAction)pressPushButton:(id)sender;

@end

@implementation MixiFirstViewController

-(id)initWithImageName:(NSString *)imageName;
{
    self = [super initWithNibName:@"MixiFirstViewController" bundle:nil];
    if (self) {
        self.title = imageName;
        self.tabBarItem.image = [UIImage imageNamed:imageName];
        self.tabBarItem.badgeValue = @"N";
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    MixiSecondViewController *vc = [[MixiSecondViewController alloc]init];
    [vc.view setFrame:CGRectMake(0, 0, vc.view.frame.size.width/4, vc.view.frame.size.height)];
    [self.view addSubview:vc.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressPushButton:(id)sender {
    [self.navigationController pushViewController:[[MixiFirstViewController alloc] initWithImageName:@"sixed"] animated:YES];
}
@end
