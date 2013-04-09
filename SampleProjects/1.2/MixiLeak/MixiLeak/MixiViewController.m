//
//  MixiViewController.m
//  MixiLeak
//
//  Created by 田村 航弥 on 2013/04/09.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiParentObject.h"
#import "MixiChildObject.h"

@interface MixiViewController ()

@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // MixiParentObject インスタンスへの強参照を parentObj が所持
    MixiParentObject *parentObj = [[MixiParentObject alloc] init];

    // MixiChildObject インスタンスへの強参照を childObj が所持
    MixiChildObject *childObj = [[MixiChildObject alloc] init];

    // MixiParentObject インスタンスのインスタンス変数が childObj への強参照を保持
    parentObj.obj = childObj;
    // MixiChildObject インスタンスのインスタンス変数が parentObj への強参照を保持
    childObj.obj = parentObj;

    //parentObj のスコープを超えるので、parentObj が MixiParentObject インスタンスへの参照を解除（解放）
    //childObj のスコープを超えるので、childObj が MixiChildObject インスタンスを解放

    // parentObj.obj が MixiChildObject インスタンスの強参照を保持
    // childObj.obj が MixiParentObject インスタンスの強参照を保持
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
