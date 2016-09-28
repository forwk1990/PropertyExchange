//
//  YPMembership.m
//  lujue
//
//  Created by itachi on 16/9/21.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import "YPMembership.h"

@implementation YPMembership

+ (YPMembershipUser *)user{
    return [[YPMembershipProvider defaultProvider] currentUser];
}

+ (void)deleteUser{
    [[YPMembershipProvider defaultProvider] deleteUser];
}

+ (void)updateUser:(YPMembershipUser *)user{
    [[YPMembershipProvider defaultProvider] updateUser:user];
}

+ (void)changeActualName:(NSString *)actualName{
    [[YPMembershipProvider defaultProvider] changeActualName:actualName];
}

+ (void)changeNickName:(NSString *)nickName{
    [[YPMembershipProvider defaultProvider] changeNickName:nickName];
}

+ (void)changePassword:(NSString *)password{
    [[YPMembershipProvider defaultProvider] changePassword:password];
}

+ (void)changePayPassword:(NSString *)payPassword{
    [[YPMembershipProvider defaultProvider] changePayPassword:payPassword];
}

+ (void)changePhoneNumber:(NSString *)phoneNumber{
    [[YPMembershipProvider defaultProvider] changePhoneNumber:phoneNumber];
}

+ (void)changeImageUrl:(NSString *)imageUrl{
    [[YPMembershipProvider defaultProvider] changeHeaderImageUrl:imageUrl];
}

+ (void)changeSignature:(NSString *)signature{
    [[YPMembershipProvider defaultProvider] changeSignature:signature];
}

+ (BOOL)isAuthenticated{
    NSString *uniqueIdentifier = [[self user] uniqueIdentifier];
    return uniqueIdentifier != nil && ![uniqueIdentifier isEqualToString:@""];
}

@end
