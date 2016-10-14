//
//  StringExtensions.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/30.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import Foundation

//NSString *total = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithLongLong:floatValue] numberStyle:NSNumberFormatterDecimalStyle];
//NSInteger intValue = (NSInteger)floatValue;
//int pointValue = round((floatValue - intValue) * 100);
//if(pointValue >0){
//  return [NSString stringWithFormat:@"%@.%d",total,pointValue];
//}else{
//  return [NSString stringWithFormat:@"%@",total];
//}

extension String
{
  
  static func decimalString(from floatValue:Float) -> String{
    let total = NumberFormatter.localizedString(from: NSNumber(value: floatValue), number: .decimal)
    let intValue:Int = Int(floatValue)
    let pointValue = round((floatValue - Float(intValue)) * 100)
    if pointValue > 0{
      return "\(total).\(pointValue)"
    }else{
      return "\(total)"
    }
  }
  
  static func moneyString(from string:String) -> String{

    guard let numberValue = NumberFormatter().number(from: string) else {return ""}
  
    return "¥ \(NumberFormatter.localizedString(from: numberValue, number: .decimal))"
    
  }
  
}
