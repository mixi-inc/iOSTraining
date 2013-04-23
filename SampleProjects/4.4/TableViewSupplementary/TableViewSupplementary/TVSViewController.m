//
//  TVSViewController.m
//  TableViewSupplementary
//
//  Created by 武田 祐一 on 2013/04/23.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TVSViewController.h"

@interface TVSViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"hogefuga";
    return cell;
}


@end
