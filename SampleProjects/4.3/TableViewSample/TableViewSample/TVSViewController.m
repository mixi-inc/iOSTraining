//
//  TVSViewController.m
//  TableViewSample
//
//  Created by 武田 祐一 on 2013/04/22.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TVSViewController.h"

#import "TVSCustomCell.h"

@interface TVSViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"TVSCustomCell" bundle:nil] forCellReuseIdentifier:@"maimai"];
    [_tableView registerNib:[UINib nibWithNibName:@"TVSCustomCell2" bundle:nil] forCellReuseIdentifier:@"daisuke"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = indexPath.row % 2 == 0 ? @"maimai" : @"daisuke";
    TVSCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.bodyLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TVSViewController *tvsViewController = [[TVSViewController alloc] init];
    [self.navigationController pushViewController:tvsViewController animated:YES];
}

@end
