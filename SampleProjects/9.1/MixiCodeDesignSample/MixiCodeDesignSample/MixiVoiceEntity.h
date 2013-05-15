//
//  MixiVoiceEntity.h
//  MixiCodeDesignSample
//
//  Created by 田村 航弥 on 2013/05/14.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixiUserEntity : NSObject

@property (nonatomic, strong) NSString *profileImageURL;
@property (nonatomic, strong) NSString *URL;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *screenName;

+(MixiUserEntity *)userEntitiWithDict:(NSDictionary *)dict;

@end

@interface MixiVoiceEntity : NSObject

@property (nonatomic, strong) NSString *voiceID;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, assign) NSInteger favoriteCount;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, strong) MixiUserEntity *userEntity;

+(MixiVoiceEntity *)voiceEntitiWithDict:(NSDictionary *)dict;

@end
