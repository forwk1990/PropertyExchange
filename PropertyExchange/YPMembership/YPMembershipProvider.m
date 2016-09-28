//
//  YPMembershipProvider.m
//  lujue
//
//  Created by itachi on 16/9/12.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import "YPMembershipProvider.h"
#import "YPMembershipCacheItem.h"

#define YPCachesDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
#define YPCachedArchiveFilePath [YPCachesDirectory stringByAppendingPathComponent:@"itachi.membership.archive"]

@implementation YPMembershipProvider{
    YPMembershipUser *_memoryMembershipUser;
}

static YPMembershipProvider* _instance = nil;

+ (instancetype)defaultProvider{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[YPMembershipProvider alloc] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_instance == nil){
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

- (instancetype)init{
    if(self = [super init]){
        self.cachePolicy = YPMembershipUserCachePolicyKeyedArchiver;
    }
    return self;
}

- (YPMembershipUser *)CreateUserWithDictionary:(NSDictionary<NSString *,NSString *> *)dictionary{
    YPMembershipUser *user = [[YPMembershipUser alloc] initWithDictionary:dictionary];
    if(self.cachePolicy == YPMembershipUserCachePolicyKeyedArchiver){
        [self archiveMembershipUser:user];
    }
    return user;
}

- (void)archiveMembershipUser:(YPMembershipUser *)user{
    YPMembershipCacheItem *cacheItem = [[YPMembershipCacheItem alloc] init];
    cacheItem.user = user;
    cacheItem.cachedDate = [[NSDate date] utc_senconds];
    cacheItem.expiration = self.expiration;
    [NSKeyedArchiver archiveRootObject:cacheItem toFile:YPCachedArchiveFilePath];
}

- (YPMembershipUser *)currentUser{
    if(_memoryMembershipUser == nil){
        if([[NSFileManager defaultManager] fileExistsAtPath:YPCachedArchiveFilePath] == false){
            return nil;
        }
        YPMembershipCacheItem *cacheItem = [NSKeyedUnarchiver unarchiveObjectWithFile:YPCachedArchiveFilePath];
        
        // 缓存过期，自动删除本地缓存
        if([cacheItem isValidate] == false){
            [self deleteUser];
            _memoryMembershipUser = nil;
            return nil;
        }
        // 每次从本地取用户时，自动续期
        [self archiveMembershipUser:cacheItem.user];
        
        // 设置内存缓存
        _memoryMembershipUser = cacheItem.user;
    }
    return _memoryMembershipUser;
}

- (void)deleteUser{
    NSError *error = nil;
    if([[NSFileManager defaultManager] removeItemAtPath:YPCachedArchiveFilePath error:&error]){
        // 清理内存缓存用户
        _memoryMembershipUser = nil;
        //....
    }
}

- (void)updateUser:(YPMembershipUser *)user{
    NSAssert(user != nil, @"更新用户不能为空");
    if(self.cachePolicy == YPMembershipUserCachePolicyKeyedArchiver){
        [self archiveMembershipUser:user];
    }
}

- (void)changeNickName:(NSString *)nickName{
    if(self.currentUser == nil) return;
    self.currentUser.name = nickName;
    [self updateUser:self.currentUser];
}

- (void)changeActualName:(NSString *)actualName{
    if(self.currentUser == nil) return;
    self.currentUser.actualName = actualName;
    [self updateUser:self.currentUser];
}

- (void)changePassword:(NSString *)password{
    if(self.currentUser == nil) return;
    self.currentUser.password = password;
    [self updateUser:self.currentUser];
}

- (void)changePayPassword:(NSString *)payPassword{
    if(self.currentUser == nil) return;
    self.currentUser.payPassword = payPassword;
    [self updateUser:self.currentUser];
}

- (void)changePhoneNumber:(NSString *)phoneNumber{
    if(self.currentUser == nil) return;
    self.currentUser.phoneNumber = phoneNumber;
    [self updateUser:self.currentUser];
}

- (void)changeHeaderImageUrl:(NSString *)imageUrl{
    if(self.currentUser == nil) return;
    self.currentUser.imageUrl = imageUrl;
    [self updateUser:self.currentUser];
}

- (void)changeSignature:(NSString *)signature{
    if(self.currentUser == nil) return;
    self.currentUser.signature = signature;
    [self updateUser:self.currentUser];
}

@end
