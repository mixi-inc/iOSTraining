//
//  MixiViewControllerSpec.m
//  janken
//
//  Created by 武田 祐一 on 2013/05/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiJanken.h"
#import <Kiwi.h>

@interface MixiViewController ()
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *aliceHandLabel;
@property (weak, nonatomic) IBOutlet UILabel *bobHandLabel;

@property (strong, nonatomic) MixiJankenPeople *alice;
@property (strong, nonatomic) MixiJankenPeople *bob;

- (IBAction)aliceRockTapped:(id)sender;
- (void)updateWinnerLabel;

@end


SPEC_BEGIN(MixiViewControllerSpec)
describe(@"janken actions", ^{

    __block MixiViewController *viewController;
    beforeAll(^{
        viewController = [[MixiViewController alloc] initWithNibName:@"MixiviewController" bundle:[NSBundle mainBundle]];
        [viewController viewDidLoad];
    });


    specify(^{
        [viewController.alice shouldNotBeNil];
        [[viewController.alice.name should] equal:@"alice"];
        [[theValue(viewController.alice.hand) should] equal:theValue(JankenHandTypeUnknown)];

        [viewController.bob shouldNotBeNil];
        [[viewController.bob.name should] equal:@"bob"];

    });


    it(@"alice button down action", ^{
        [[viewController should] receive:@selector(updateWinnerLabel) withCount:1];
        [viewController aliceRockTapped:nil];
        [[theValue(viewController.alice.hand) should] equal:theValue(JankenHandTypeRock)];

    });



});
SPEC_END