//
//  BSViewController.m
//  BlocksSample
//
//  Created by 武田 祐一 on 2013/05/01.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "BSViewController.h"

typedef double (^blk2_t)(int);


@interface BSViewController ()

@end

typedef void (^blk_t)();

@interface BlockSample : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) blk_t name_print_block;
@end

@implementation BlockSample

- (id)init
{
    self = [super init];
    if (self) {
        __weak BlockSample *weakSelf = self;
        _name_print_block = ^{
            NSLog(@"%@", weakSelf.name);
        };
    }
    return self;
}

@end













@implementation BSViewController


void func1( int (^tmp)(int) ) { // 引数として利用
    tmp(10);
}

// "int型を引数としてとり、double型"を返すBlock型を返り値として、float型の引数aを取る関数func2の定義
double (^func2(float a))(int) {
    return ^double(int b){ return a + b;};
}

blk2_t func3(float a) {
    return ^double(int b){ return a + b;};
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self section1];
    [self section2];

}

- (void)section1
{
    void (^b)(int); // 戻り値がvoid型で引数としてint型の変数を取るblock型変数bの宣言

    b = ^void(int a){ NSLog(@"%d", a); }; // b へ blockを代入

    b(10); // bに代入されたblockを実行


    BOOL (^b1)(int, int); // 戻り値がBOOL型で引数として二つのint型を取るblock型変数b1の宣言
    b1 = ^BOOL(int x, int y){ return x < y; }; // block構文を変数へ代入

    BOOL result = b1(10, 20); // block型変数b1を実行。resultにはYESが入る。

    NSLog(@"%d", result);


    double (^my_blk)(int) = func2(10);
    double z = my_blk(20);
    NSLog(@"%lf", z);

    blk2_t my_blk2 = func3(50);
    double y = my_blk2(5);
    NSLog(@"%lf", y);
}


- (void)section2
{
    __block int a = 10;
    void (^b1)() = ^{
        a = 20;
        NSLog(@"a = %d", a);
    };
    b1(); // コンソールに a = 10 と表示される

    NSLog(@"a = %d", a);

    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"hoge", @"fuga"]];
    void (^b2)() = ^{
        [array addObject:@"piyo"];
    };
    b2();
    NSLog(@"%@", array);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
