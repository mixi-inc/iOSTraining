//
//  MixiViewController.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiJanken.h"

@interface MixiViewController ()
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *aliceHandLabel;
@property (weak, nonatomic) IBOutlet UILabel *bobHandLabel;

@property (strong, nonatomic) MixiJankenPeople *alice;
@property (strong, nonatomic) MixiJankenPeople *bob;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _alice = [[MixiJankenPeople alloc] init];
    _alice.name = @"alice";
    _alice.hand = JankenHandTypeUnknown;

    _bob = [[MixiJankenPeople alloc] init];
    _bob.name = @"bob";
    _bob.hand = JankenHandTypeUnknown;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// ジャンケンアクション
- (IBAction)aliceRockTapped:(id)sender {
    _alice.hand = JankenHandTypeRock;
    _aliceHandLabel.text = @"グー";
    [self updateWinnerLabel];
}

- (IBAction)aliceScissorsTapped:(id)sender {
    _alice.hand = JankenHandTypeScissors;
    _aliceHandLabel.text = @"チョキ";
    [self updateWinnerLabel];
}

- (IBAction)alicePaperTapped:(id)sender {
    _alice.hand = JankenHandTypePaper;
    _aliceHandLabel.text = @"パー";
    [self updateWinnerLabel];
}

- (IBAction)bobRockTapped:(id)sender {
    _bob.hand = JankenHandTypeRock;
    _bobHandLabel.text = @"グー";
    [self updateWinnerLabel];
}

- (IBAction)bobScissorsTapped:(id)sender {
    _bob.hand = JankenHandTypeScissors;
    _bobHandLabel.text = @"チョキ";
    [self updateWinnerLabel];
}

- (IBAction)bobPaperTapped:(id)sender {
    _bob.hand = JankenHandTypePaper;
    _bobHandLabel.text = @"パー";
    [self updateWinnerLabel];
}

- (void)updateWinnerLabel
{
    if (_bob.hand == JankenHandTypeUnknown || _alice.hand == JankenHandTypeUnknown) {
        return;
    }

    MixiJankenPeople *winner = [MixiJankenDecider jankenWithPeoples:@[_alice, _bob]];

    if (winner == nil) {
        _winnerLabel.text = @"あいこ";
    } else {
        _winnerLabel.text = winner.name;
    }
}

@end
