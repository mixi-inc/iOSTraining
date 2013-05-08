//
//  MixiViewController.m
//  MixiSampleProject
//
//  Created by 武田 祐一 on 2013/05/08.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *imageURLs;
@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.delegate = self;
    _tableView.dataSource = self;

    _imageURLs = [NSMutableArray array];

    NSURL *url = [NSURL URLWithString:@"https://gdata.youtube.com/feeds/api/standardfeeds/top_rated?v=2&alt=json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *res, NSData *data, NSError *error) {

        if (error) {
            NSLog(@"%@", error);
        }

        NSError *jsonError;

        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];

        if (jsonError) {
            NSLog(@"%@", jsonError);
        }

        NSArray *entry = json[@"feed"][@"entry"];

        for (NSDictionary *dict in entry) {
            NSString *urlStr = dict[@"media$group"][@"media$thumbnail"][0][@"url"];
            [_imageURLs addObject:[NSURL URLWithString:urlStr]];
        }

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];


    }];


    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d", _imageURLs.count);
    return _imageURLs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    NSURL *url = _imageURLs[indexPath.row];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *res, NSData *data, NSError *error) {

        UIImage *img = [UIImage imageWithData:data];
        cell.imageView.image = img;

    }];

    return cell;
}


@end
