//
//  YPMembershipCacheItem.h
//  lujue
//
//  Created by itachi on 16/9/20.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPMembershipUser.h"
#import "NSDate+UTC.h"

@interface YPMembershipCacheItem : NSObject<NSCoding>

/// 缓存用户对象
@property (nonatomic,strong) YPMembershipUser *user;

/// 缓存过期时间
@property (nonatomic,assign) NSTimeInterval expiration;

/// 缓存时间
@property (nonatomic,assign) NSInteger cachedDate;

/// 该缓存是否有效
- (BOOL)isValidate;

@end
