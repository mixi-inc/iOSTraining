//
//  MixiSharedObject.h
//  MixiCodeDesign2
//
//  Created by 田村 航弥 on 2013/05/16.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixiSharedObject : NSObject

+(MixiSharedObject *)sharedInstance;

-(void)doSomthing;

@end
