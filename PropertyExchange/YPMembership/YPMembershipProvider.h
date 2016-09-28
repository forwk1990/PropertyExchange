//
//  YPMembershipProvider.h
//  lujue
//
//  Created by itachi on 16/9/12.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPMembershipUser.h"

typedef enum : NSUInteger {
    YPMembershipUserCachePolicyNone = -1, // 不缓存
    YPMembershipUserCachePolicyKeyedArchiver = 0 // 采用NSKeyed​Archiver缓存本地
} YPMembershipUserCachePolicy;

@interface YPMembershipProvider : NSObject

/// 开启磁盘缓存
@property (nonatomic,assign,getter=isEnabledDiskCache) BOOL enabledDiskCache;

/// 缓存方针
@property (nonatomic,assign) YPMembershipUserCachePolicy cachePolicy;

/// 缓存过期时间
@property (nonatomic,assign) NSTimeInterval expiration;

/// 当前用户
@property (nonatomic,strong,readonly) YPMembershipUser *currentUser;

/// singleton instance
+ (instancetype)defaultProvider;

/// 根据属性字典创建用户
- (YPMembershipUser *)CreateUserWithDictionary:(NSDictionary<NSString *,NSString *> *)dictionary;

/// 删除本地用户
- (void)deleteUser;

/// 更新用户
- (void)updateUser:(YPMembershipUser *)user;

/// 更改登录密码
- (void)changePassword:(NSString *)password;
/// 更改支付密码
- (void)changePayPassword:(NSString *)payPassword;
/// 更改手机号码
- (void)changePhoneNumber:(NSString *)phoneNumber;
/// 更改用户头像
- (void)changeHeaderImageUrl:(NSString *)imageUrl;
/// 更改用户昵称
- (void)changeNickName:(NSString *)nickName;
/// 真实名称
- (void)changeActualName:(NSString *)actualName;
/// 更改签名信息
- (void)changeSignature:(NSString *)signature;

@end
