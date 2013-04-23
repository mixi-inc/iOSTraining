//
//  TVSViewController.m
//  TableViewSample
//
//  Created by 武田 祐一 on 2013/04/22.
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
	// Do any additional setup after loading the view, typically from a nib.

    _tableView.dataSource = self;
    _tableView.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TVSViewController *tvsViewController = [[TVSViewController alloc] init];
    [self.navigationController pushViewController:tvsViewController animated:YES];
}

@end
