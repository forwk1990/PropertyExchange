//
//  YPRightBuyTableViewCellModel.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/30.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct YPRightBuyTableViewCellModel
{
  public var isSuggest:Bool = false
  public var title:String?
  public var totalMoney:Double
  public var rate:Float
  public var deadline:String?
  public var originTotalMoney:Double
  public var originRate:Float
  public var originDeadline:String?
  
  public init(_ json: JSON){
    self.title = json.dictionary?["title"]?.stringValue
    if let _isSuggect = json.dictionary?["isSuggest"]?.intValue , _isSuggect == 1{
      self.isSuggest = true
    }else{
      self.isSuggest = false
    }
    self.totalMoney = (json.dictionary?["totalMoney"]?.doubleValue)!
    self.rate = (json.dictionary?["rate"]?.floatValue)!
    self.deadline = json.dictionary?["deadline"]?.stringValue
    self.originTotalMoney = (json.dictionary?["originTotalMoney"]?.doubleValue)!
    self.originDeadline = json.dictionary?["originDeadline"]?.stringValue
    self.originRate =  (json.dictionary?["originRate"]?.floatValue)!
  }
  
  public static func models(json: JSON) -> [YPRightBuyTableViewCellModel]{
    var models = [YPRightBuyTableViewCellModel]()
    guard let jsonArray = json.array else {return models}
    for i in 0..<jsonArray.count {
      models.append(YPRightBuyTableViewCellModel(jsonArray[i]))
    }
    return models
  }
  
}
