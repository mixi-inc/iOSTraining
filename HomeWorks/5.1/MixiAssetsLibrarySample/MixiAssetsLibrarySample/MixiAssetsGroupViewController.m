//
//  MixiAssetsGroupViewController.m
//  MixiAssetsLibrarySample
//
//  Created by 田村 航弥 on 2013/04/24.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiAssetsGroupViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "MixiAssetsViewController.h"

@interface MixiAssetsGroupViewController ()

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
@property (nonatomic, strong) NSMutableArray *assetsGroups;
@property (weak, nonatomic) IBOutlet UITableView *assetTableView;

@end

@implementation MixiAssetsGroupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(tapCloseButton:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;

    _assetsGroups = [NSMutableArray array];
    _assetsLibrary = [[ALAssetsLibrary alloc] init];
    [_assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll
                            usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                NSLog(@"AssetsGroup : %@", group);
                                if (group) [_assetsGroups insertObject:group atIndex:0];
                                else [_assetTableView reloadData];
                            } failureBlock:^(NSError *error) {
                                // iPhone の設定で写真アクセスを拒否している場合
                            }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - tableViewDataSource methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_assetsGroups count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    ALAssetsGroup *assetsGroup = _assetsGroups[indexPath.row];
    NSString *groupName = [assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    NSInteger numberOfAssets = [assetsGroup numberOfAssets];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%d)",  groupName, numberOfAssets];
    [cell.imageView setImage:[UIImage imageWithCGImage:[assetsGroup posterImage]]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

#pragma mark - UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ALAssetsGroup *assetsGroup = _assetsGroups[indexPath.row];
    MixiAssetsViewController *assetVC = [[MixiAssetsViewController alloc] initWithAssetsGroup:assetsGroup];
    assetVC.delegate = self.delegate;
    [self.navigationController pushViewController:assetVC animated:YES];
}

@end
