//
//  MixiRequestManager.m
//  MixiRequestManagerSample
//
//  Created by 武田 祐一 on 2013/05/13.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "MixiRequestManager.h"

@implementation MixiRequestManager
+(void)sendAsynchronousRequest:(NSURLRequest *)request completionHandler:(completeBlock_t)cBlock errorHandler:(errorBlock_t)eBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSError *error;
        NSURLResponse *response;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                eBlock(response, error);
            } else {
                cBlock(response, data);
            }
        });

    });
}
@end
