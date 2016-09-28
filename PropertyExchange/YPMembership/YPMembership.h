//
//  YPMembership.h
//  lujue
//
//  Created by itachi on 16/9/21.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPMembershipUser.h"
#import "YPMembershipProvider.h"

@interface YPMembership : NSObject

+ (YPMembershipUser *)user;
+ (void)deleteUser;

+ (void)updateUser:(YPMembershipUser *)user;
+ (void)changeActualName:(NSString *)actualName;
+ (void)changeNickName:(NSString *)nickName;
+ (void)changePassword:(NSString *)password;
+ (void)changePayPassword:(NSString *)payPassword;
+ (void)changePhoneNumber:(NSString *)phoneNumber;
+ (void)changeImageUrl:(NSString *)imageUrl;
+ (void)changeSignature:(NSString *)signature;

+ (BOOL)isAuthenticated;

@end
