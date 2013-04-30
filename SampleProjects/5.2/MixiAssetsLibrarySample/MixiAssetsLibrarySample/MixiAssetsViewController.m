//
//  MixiAssetsViewController.m
//  MixiAssetsLibrarySample
//
//  Created by 田村 航弥 on 2013/04/30.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiAssetsViewController.h"

@interface MixiAssetsViewController ()

@property (strong, nonatomic) ALAssetsGroup *assetsGroup;
@property (strong, nonatomic) NSMutableArray *assets;

@property (weak, nonatomic) IBOutlet UITableView *assetsTableView;

@end

@implementation MixiAssetsViewController

- (id)initWithAssetsGroup:(ALAssetsGroup *)assetsGroup
{
    self = [super initWithNibName:@"MixiAssetsViewController" bundle:nil];
    if (self) {
        // Custom initialization
        _assetsGroup = assetsGroup;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    _assets = [NSMutableArray array];
    [_assetsGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        NSLog(@"asset %@", result);
        if(result) [_assets addObject:result];
        else [_assetsTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_assets count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }

    ALAsset *asset = _assets[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [asset valueForProperty:ALAssetPropertyDate]];
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyLocation]);
    [cell.imageView setImage:[UIImage imageWithCGImage:[asset thumbnail]]];
    return cell;
}

#pragma mark - UITableViewDelegate

@end
