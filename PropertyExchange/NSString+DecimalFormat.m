//
//  NSString+DecimalFormat.m
//  PropertyExchange
//
//  Created by itachi on 16/9/30.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "NSString+DecimalFormat.h"

@implementation NSString (DecimalFormat)

+ (NSString *)decimalStringWithFloat:(CGFloat)floatValue{
  NSString *total = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithLongLong:floatValue] numberStyle:NSNumberFormatterDecimalStyle];
  NSInteger intValue = (NSInteger)floatValue;
  int pointValue = round((floatValue - intValue) * 100);
  if(pointValue >0){
    return [NSString stringWithFormat:@"%@.%d",total,pointValue];
  }else{
    return [NSString stringWithFormat:@"%@",total];
  }
}

@end
