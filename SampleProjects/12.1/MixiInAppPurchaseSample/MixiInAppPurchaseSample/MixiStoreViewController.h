//
//  MixiStoreViewController.h
//  MixiInAppPurchaseSample
//
//  Created by 田村 航弥 on 2013/05/22.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface MixiStoreViewController : UIViewController
<SKProductsRequestDelegate,
SKPaymentTransactionObserver>

@end
