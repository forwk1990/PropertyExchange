//
//  YPMembershipCacheItem.m
//  lujue
//
//  Created by itachi on 16/9/20.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import "YPMembershipCacheItem.h"

@implementation YPMembershipCacheItem

- (BOOL)isValidate{
    NSUInteger currentSeconds = [[NSDate date] utc_senconds];
    if(currentSeconds < self.cachedDate){
        return NO;
    }
    if(self.cachedDate - currentSeconds > self.expiration){
        return NO;
    }
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.user forKey:@"user"];
    [coder encodeDouble:self.expiration forKey:@"expiration"];
    [coder encodeInteger:self.cachedDate forKey:@"cachedDate"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.user = [aDecoder decodeObjectForKey:@"user"];
        self.expiration = [aDecoder decodeDoubleForKey:@"expiration"];
        self.cachedDate = [aDecoder decodeIntegerForKey:@"cachedDate"];
    }
    return self;
}



@end
