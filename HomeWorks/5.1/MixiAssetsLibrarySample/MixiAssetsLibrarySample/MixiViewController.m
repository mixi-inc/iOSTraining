//
//  MixiViewController.m
//  MixiAssetsLibrarySample
//
//  Created by 田村 航弥 on 2013/04/30.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiAssetsGroupViewController.h"

@interface MixiViewController ()
@property (weak, nonatomic) IBOutlet UITableView *selectedPhotoTableView;
@property (strong, nonatomic) NSArray *selectedAssets;

- (IBAction)pressShowAssetsGroupButton:(id)sender;
@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _selectedAssets = [NSArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressShowAssetsGroupButton:(id)sender
{
    MixiAssetsGroupViewController *assetsGroupVC = [[MixiAssetsGroupViewController alloc] initWithNibName:@"MixiAssetsGroupViewController" bundle:nil];
    assetsGroupVC.delegate = self;
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:assetsGroupVC];
    [self presentViewController:nc animated:YES completion:nil];
}

#pragma mark - MixiAssetsViewControllerDelegate methods
-(void)assetsViewControllerDidSelectedPhotos:(NSArray *)assets
{
    [self dismissViewControllerAnimated:YES completion:nil];
    _selectedAssets = assets;
    [_selectedPhotoTableView reloadData];
}

#pragma mark - UITableViewDatasource methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_selectedAssets count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }

    ALAsset *asset = _selectedAssets[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [asset valueForProperty:ALAssetPropertyDate]];
    [cell.imageView setImage:[UIImage imageWithCGImage:[asset thumbnail]]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark - UITableViewDelegate methods

@end
