//
//  MixiViewController.m
//  MixiTimelineSample
//
//  Created by 田村 航弥 on 2013/05/13.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiTimelineCell.h"
#import "MixiTimelineCellHeightCalculator.h"

@interface MixiViewController ()

@property (nonatomic, strong) MixiTimeLineModel *timelineModel;
@property (nonatomic, weak) IBOutlet UITableView *timelineTableView;
@property (nonatomic, weak) IBOutlet UIView *loadingView;
@property (nonatomic, weak) IBOutlet UILabel *connectionFaildLabel;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _timelineModel = [[MixiTimeLineModel alloc] init];
    _timelineModel.delegate = self;

    [_timelineModel fetchTimelineData];

    [_timelineTableView registerNib:[UINib nibWithNibName:@"MixiTimelineTextCell" bundle:nil] forCellReuseIdentifier:@"text"];
    [_timelineTableView registerNib:[UINib nibWithNibName:@"MixiTimelinePhotoCell" bundle:nil] forCellReuseIdentifier:@"photo"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MixiTimelineModelDelegate methods
-(void)timeLineModelDidFinishLoad
{
    [_timelineTableView reloadData];
    [_loadingView removeFromSuperview];
}

-(void)timeLineModelDidFailLoad
{
    [_loadingView removeFromSuperview];
    _connectionFaildLabel.hidden = NO;
    _connectionFaildLabel.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
        _connectionFaildLabel.alpha = 1.0;
        [self performSelector:@selector(hideConnectionFaildLabel) withObject:self afterDelay:1.0];
    }];
}

-(void)hideConnectionFaildLabel
{
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         _connectionFaildLabel.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         _connectionFaildLabel.hidden = YES;
                     }];
}

#pragma mark - UITableViewDatasource Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_timelineModel.timelineArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MixiTimelineEntity *entity = _timelineModel.timelineArray[indexPath.row];
    NSString *identifier = entity.objectType;
    MixiTimelineCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [cell composeUIWithEntity:entity];
    return cell;
}

#pragma mark - UITableViewDelegate methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MixiTimelineEntity *entity = _timelineModel.timelineArray[indexPath.row];
    CGFloat height = [MixiTimelineCellHeightCalculator calculateCellHeightWithTimelineEntity:entity];
    return height;
}

@end
