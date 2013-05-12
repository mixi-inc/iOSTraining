//
//  MixiViewController.m
//  MixiKVOSample
//
//  Created by Koya Tamura on 2013/05/12.
//  Copyright (c) 2013年 tamotamago. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()

@property (nonatomic, strong) MixiCounter *counter;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

- (IBAction)pressPushButton:(id)sender;
- (IBAction)pressCountUpButton:(id)sender;
- (IBAction)pressCountDownButton:(id)sender;

@end

@implementation MixiViewController

-(id)initWithCounter:(MixiCounter *)counter
{
    self = [super initWithNibName:@"MixiViewController" bundle:nil];
    if(self){
        _counter = counter;
    }
    return self;
}

-(void)dealloc
{
    [_counter removeObserver:self forKeyPath:@"count"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_counter addObserver:self
               forKeyPath:@"count"
                  options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)
                  context:nil];

    _countLabel.text = [NSString stringWithFormat:@"%d", _counter.count];
    [_countLabel sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
    NSLog(@"%@", change);
    _countLabel.text = [NSString stringWithFormat:@"%d", _counter.count];
    [_countLabel sizeToFit];
}

#pragma mark - action handler
- (IBAction)pressPushButton:(id)sender
{
    MixiViewController *vc = [[MixiViewController alloc] initWithCounter:_counter];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)pressCountUpButton:(id)sender
{
    _counter.count ++;
    _countLabel.text = [NSString stringWithFormat:@"%d", _counter.count];
    [_countLabel sizeToFit];
}

- (IBAction)pressCountDownButton:(id)sender
{
    _counter.count --;
    _countLabel.text = [NSString stringWithFormat:@"%d", _counter.count];
    [_countLabel sizeToFit];
}

@end
