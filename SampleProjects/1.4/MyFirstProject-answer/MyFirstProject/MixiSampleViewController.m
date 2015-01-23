//
//  MixiSampleViewController.m
//  MyFirstProject
//
//  Created by yuichi.takeda on 1/16/15.
//  Copyright (c) 2015 mixi, Inc. All rights reserved.
//

#import "MixiSampleViewController.h"
#import "MySecondViewController.h"

@interface MixiSampleViewController ()

@end

@implementation MixiSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label.text = @"Test";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    self.label.text = @"YES";
}

- (IBAction)showModalFromSegueButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"presentMySecondViewController" sender:self];
}

- (IBAction)showModalFromProgramButtonTapped:(id)sender {
    MySecondViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MySecondViewController"];
    secondViewController.delegate = self;
    [self presentViewController:secondViewController animated:YES completion:nil];
}


- (void)secondViewControllerButtonTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"presentMySecondViewController"]) {
        MySecondViewController *destination = segue.destinationViewController;
        destination.delegate = self;
    }

}

@end
