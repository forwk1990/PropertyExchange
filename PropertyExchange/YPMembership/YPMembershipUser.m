//
//  YPMembershipUser.m
//  lujue
//
//  Created by itachi on 16/9/12.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import "YPMembershipUser.h"
#import "YPMembershipProvider.h"

@interface YPMembershipUser ()

@property (nonatomic,strong) YPMembershipProvider *provider;

@end

@implementation YPMembershipUser

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.uniqueIdentifier forKey:@"uniqueIdentifier"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.sex forKey:@"sex"];
    [coder encodeObject:self.actualName forKey:@"actualName"];
    [coder encodeObject:self.password forKey:@"password"];
    [coder encodeObject:self.imageUrl forKey:@"imageUrl"];
    [coder encodeObject:self.signature forKey:@"signature"];
    [coder encodeObject:self.token forKey:@"token"];
    [coder encodeObject:self.payPassword forKey:@"payPassword"];
    [coder encodeObject:self.email forKey:@"email"];
    [coder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.uniqueIdentifier = [aDecoder decodeObjectForKey:@"uniqueIdentifier"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.actualName = [aDecoder decodeObjectForKey:@"actualName"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.imageUrl = [aDecoder decodeObjectForKey:@"imageUrl"];
        self.signature = [aDecoder decodeObjectForKey:@"signature"];
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.payPassword = [aDecoder decodeObjectForKey:@"payPassword"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,NSString *> *)dictionary{
    if(self = [super init]){
        if([dictionary.allKeys containsObject:@"uniqueIdentifier"]){
            [self setValue:dictionary[@"uniqueIdentifier"] forKey:@"uniqueIdentifier"];
        }
        if([dictionary.allKeys containsObject:@"name"]){
            [self setValue:dictionary[@"name"] forKey:@"name"];
        }
        if([dictionary.allKeys containsObject:@"sex"]){
            [self setValue:dictionary[@"sex"] forKey:@"sex"];
        }
        if([dictionary.allKeys containsObject:@"actualName"]){
            [self setValue:dictionary[@"actualName"] forKey:@"actualName"];
        }
        if([dictionary.allKeys containsObject:@"password"]){
            [self setValue:dictionary[@"password"] forKey:@"password"];
        }
        if([dictionary.allKeys containsObject:@"imageUrl"]){
            [self setValue:dictionary[@"imageUrl"] forKey:@"imageUrl"];
        }
        if([dictionary.allKeys containsObject:@"signature"]){
            [self setValue:dictionary[@"signature"] forKey:@"signature"];
        }
        if([dictionary.allKeys containsObject:@"token"]){
            [self setValue:dictionary[@"token"] forKey:@"token"];
        }
        if([dictionary.allKeys containsObject:@"payPassword"]){
            [self setValue:dictionary[@"payPassword"] forKey:@"payPassword"];
        }
        if([dictionary.allKeys containsObject:@"email"]){
            [self setValue:dictionary[@"email"] forKey:@"email"];
        }
        if([dictionary.allKeys containsObject:@"phoneNumber"]){
            [self setValue:dictionary[@"phoneNumber"] forKey:@"phoneNumber"];
        }
    }
    return self;
}




@end
