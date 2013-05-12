//
//  MixiSecondViewController.m
//  MixiNotificationSample
//
//  Created by Koya Tamura on 2013/05/12.
//  Copyright (c) 2013年 Koya Tamura. All rights reserved.
//

#import "MixiSecondViewController.h"

@interface MixiSecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation MixiSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(recieveNotification:)
//                                                 name:@"notificationName"
//                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserverForName:@"notificationName"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      NSLog(@"%@", note);
                                                      NSDictionary *userInfo = note.userInfo;
                                                      _label.text = userInfo[@"key"];
                                                  }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)recieveNotification:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    _label.text = userInfo[@"key"];
}


@end
