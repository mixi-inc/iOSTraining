//
//  FirstViewController.m
//  NavigationPractice
//
//  Created by yuichi.takeda on 2/5/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "FirstViewController.h"
#import "NextViewController.h"

@interface FirstViewController ()
@property (nonatomic, strong) NSString *stringToPass;
@end

@implementation FirstViewController


- (IBAction)buttonATapped:(id)sender {
    self.stringToPass = @"Button A Tapped";
    [self performSegueWithIdentifier:@"pushToNextViewController" sender:nil];
}

- (IBAction)buttonBTapped:(id)sender {
    self.stringToPass = @"Button B Tapped";
    [self performSegueWithIdentifier:@"pushToNextViewController" sender:nil];

}

- (IBAction)buttonCTapped:(id)sender {
    self.stringToPass = @"Button C Tapped";
    [self performSegueWithIdentifier:@"pushToNextViewController" sender:nil];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NextViewController *destinationViewController = segue.destinationViewController;
    destinationViewController.messageFromPrevious = self.stringToPass;
}

@end
