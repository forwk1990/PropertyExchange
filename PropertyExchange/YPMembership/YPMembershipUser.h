//
//  YPMembershipUser.h
//  lujue
//
//  Created by itachi on 16/9/12.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import <Foundation/Foundation.h>


/// 成员用户
@interface YPMembershipUser : NSObject<NSCoding>

/// 用户对象唯一标识符
@property (nonatomic,copy,nullable) NSString *uniqueIdentifier;
/// 用户名称
@property (nonatomic,copy,nullable) NSString *name;
/// 性别
@property (nonatomic,copy,nullable) NSString *sex;
/// 用户真实名称
@property (nonatomic,copy,nullable) NSString *actualName;
/// 用户密码
@property (nonatomic,copy,nullable) NSString *password;
/// 用户头像地址
@property (nonatomic,copy,nullable) NSString *imageUrl;
/// 用户个性签名
@property (nonatomic,copy,nullable) NSString *signature;
/// 登录口令
@property (nonatomic,copy,nullable) NSString *token;
/// 支付密码
@property (nonatomic,copy,nullable) NSString *payPassword;
/// 邮箱地址
@property (nonatomic,copy,nullable) NSString *email;
/// 手机号码
@property (nonatomic,copy,nullable) NSString *phoneNumber;

//@property (nonatomic,assign) BOOL authenticated;

- (instancetype)initWithDictionary:(NSDictionary<NSString *,NSString *> *)dictionary;

@end
