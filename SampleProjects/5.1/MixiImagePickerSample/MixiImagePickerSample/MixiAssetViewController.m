//
//  MixiAssetViewController.m
//  MixiImagePickerSample
//
//  Created by 田村 航弥 on 2013/04/24.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiAssetViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MixiAssetViewController ()

@property (nonatomic, strong) ALAssetsLibrary *library;
@property (nonatomic, strong) NSMutableArray *assetsGroups;
@property (weak, nonatomic) IBOutlet UITableView *assetTableView;

@end

@implementation MixiAssetViewController

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
    _library = [[ALAssetsLibrary alloc] init];
    [_library enumerateGroupsWithTypes:ALAssetsGroupAll
                            usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
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


@end
