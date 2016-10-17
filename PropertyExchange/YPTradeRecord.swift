//
//  YPTradeRecord.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/17.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import Foundation
import SwiftyJSON


public struct YPTradeRecord
{
  public var money:Float = 0.0
  public var desc:String = ""
  public var date:String = ""
  public var isOut:Bool = true
  
  public init(_ json: JSON){
    self.desc = (json.dictionary?["desc"]?.stringValue)!
    if let _isOut = json.dictionary?["isOut"]?.intValue , _isOut == 1{
      self.isOut = true
    }else{
      self.isOut = false
    }
  
    self.money = (json.dictionary?["money"]?.floatValue)!
    self.date = (json.dictionary?["date"]?.stringValue)!
  }
  
  public static func models(json: JSON) -> [YPTradeRecord]{
    var models = [YPTradeRecord]()
    guard let jsonArray = json.array else {return models}
    for i in 0..<jsonArray.count{
      models.append(YPTradeRecord(jsonArray[i]))
    }
    return models
  }
  
}
