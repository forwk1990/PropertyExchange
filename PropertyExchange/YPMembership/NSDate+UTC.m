//
//  NSDate+UTC.m
//  lujue
//
//  Created by itachi on 16/9/20.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//

#import "NSDate+UTC.h"

@implementation NSDate (UTC)

- (NSInteger)utc_senconds{
    NSTimeZone *utcTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    return [utcTimeZone secondsFromGMTForDate:self];
}

@end
