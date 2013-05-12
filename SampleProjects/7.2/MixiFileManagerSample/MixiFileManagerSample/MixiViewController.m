//
//  MixiViewController.m
//  MixiFileManagerSample
//
//  Created by 田村 航弥 on 2013/05/09.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"

@interface MixiViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

- (IBAction)pressSaveButton:(id)sender;
- (IBAction)pressReadButton:(id)sender;
- (IBAction)pressDeleteButton:(id)sender;

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSURL *)getFileURL
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory
                                        inDomains:NSUserDomainMask];
    NSString *documentURLString = [(NSURL*)urls[0] absoluteString];
    NSURL *fileURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@save.xml", documentURLString]];
    return fileURL;
}

- (IBAction)pressSaveButton:(id)sender
{
    NSDictionary *savedDict = @{@"text1":_textField1.text, @"text2":_textField2.text};
    [savedDict writeToURL:[self getFileURL] atomically:YES];
}

- (IBAction)pressReadButton:(id)sender
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:[self getFileURL].path]){
        NSDictionary *readDict = [NSDictionary dictionaryWithContentsOfURL:[self getFileURL]];
        _textField1.text = readDict[@"text1"];
        _textField2.text = readDict[@"text2"];
        NSLog(@"%@", readDict);
    }else{
        NSLog(@"not exist");
    }
}

- (IBAction)pressDeleteButton:(id)sender
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:[self getFileURL].path]){
        NSError *error = nil;
        [fileManager removeItemAtURL:[self getFileURL] error:&error];
    }else{
        NSLog(@"not exist");
    }
}
@end
