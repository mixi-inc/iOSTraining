//
//  MixiStoreViewController.m
//  MixiInAppPurchaseSample
//
//  Created by 田村 航弥 on 2013/05/22.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import "MixiStoreViewController.h"
static NSString *const kMixiStoreProductCosumable1ID = @"hoge";
static NSString *const kMixiStoreProductNonConsumable1ID = @"fuga";

@interface MixiStoreViewController ()

@property (nonatomic, strong) NSArray *products;
@property (weak, nonatomic) IBOutlet UIButton *consumableProductButton;
@property (weak, nonatomic) IBOutlet UIButton *nonConsumableProductButton;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *enabledLabel;
@property (nonatomic, assign) NSInteger consumableCount;

@end

@implementation MixiStoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // In-App purchase に登録してあるプロダクト情報を取得するためのリクエスト作成
    NSSet *productIDs = [NSSet setWithObjects:kMixiStoreProductCosumable1ID, kMixiStoreProductNonConsumable1ID, nil];
    SKProductsRequest *request= [[SKProductsRequest alloc] initWithProductIdentifiers:productIDs];
    request.delegate = self;
    [request start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button action
- (IBAction)pressConsumableButton:(id)sender
{
    [self purchaseProduct:_products[0]];
}

- (IBAction)preeeNonConsumableButton:(id)sender
{
    [self purchaseProduct:_products[1]];
}

- (IBAction)pressRestoreButton:(id)sender
{
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

-(void) purchaseProduct:(SKProduct *)product
{
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

#pragma mark - SKProductRequestDelegate methods
- (void)productsRequest:(SKProductsRequest *)request
     didReceiveResponse:(SKProductsResponse *)response
{
    
    _products = response.products;
    [_consumableProductButton setTitle:((SKProduct *)_products[0]).localizedTitle
                              forState:UIControlStateNormal];
    _consumableProductButton.hidden = NO;

    [_nonConsumableProductButton setTitle:((SKProduct *)_products[1]).localizedTitle
                                 forState:UIControlStateNormal];
    _nonConsumableProductButton.hidden = NO;

    //transaction の observer として登録
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

#pragma mark - SKPaymentTransactionOvserver methods
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions){
        switch (transaction.transactionState){
            // 購入中
            case SKPaymentTransactionStatePurchasing:
                //do something
                break;

            // 購入完了
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;

            // 購入失敗
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;

            // リストア完了
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - private methods

- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    //consumable ならカウントを増やす
    if ([transaction.payment.productIdentifier isEqualToString:kMixiStoreProductCosumable1ID]) {
        _consumableCount ++;
        _countLabel.text = [NSString stringWithFormat:@"%d", _consumableCount];
    }
    //non-consumable なら enabled にする
    else{
        _enabledLabel.text = @"enabled";
    }
    

    // ペイメントキューからトランザクションを削除する
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    switch (transaction.error.code) {
        case SKErrorPaymentCancelled:
            NSLog(@"press cancel button.");
            break;

        //error handling
            
        default:
            break;
    }
    
    // ペイメントキューからトランザクションを削除する
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void)restoreTransaction:(SKPaymentTransaction *)transaction
{
    _enabledLabel.text = @"enabled";
    // ペイメントキューからトランザクションを削除する
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

@end
