//
//  MixiInstrumentsViewController.m
//  DebuggingApp
//
//  Created by 武田 祐一 on 2013/05/13.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiInstrumentsViewController.h"

@interface LeakObject : NSObject
@property (nonatomic, strong) LeakObject *obj;
@end

@implementation LeakObject
@end

@interface MixiInstrumentsViewController ()
@end

@implementation MixiInstrumentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"Second"];
        //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - UITableView Delegate and Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale systemLocale];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";

    cell.textLabel.text = [formatter stringFromDate:[NSDate date]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeakObject *obj1 = [LeakObject new];
    LeakObject *obj2 = [LeakObject new];

    obj1.obj = obj2;
    obj2.obj = obj1;
}

@end

