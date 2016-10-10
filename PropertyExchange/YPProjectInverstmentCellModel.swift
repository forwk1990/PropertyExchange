//
//  YPProjectInverstmentCellModel.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/29.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import Foundation
import SwiftyJSON


public struct YPProjectInverstmentCellModel
{
  public var isSuggest:Bool = false
  public var title:String?
  public var totalMoney:Double = 0
  public var rate:Float = 0
  public var deadline:String?
  public var remainMoney:Double = 0
  public var payingWay:String?
  public var min:Double = 0
  public var max:Double = 0
  public var borrower:String? = ""
  public var borrowerDate:String? = ""
  
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
    self.remainMoney = (json.dictionary?["remainMoney"]?.doubleValue)!
    self.payingWay = json.dictionary?["payingWay"]?.stringValue
    self.min = (json.dictionary?["min"]?.doubleValue)!
    self.max = (json.dictionary?["max"]?.doubleValue)!
    self.borrower = json.dictionary?["borrower"]?.stringValue
    self.borrowerDate = json.dictionary?["borrowerDate"]?.stringValue
  }
  
  public static func models(json: JSON) -> [YPProjectInverstmentCellModel]{
    var models = [YPProjectInverstmentCellModel]()
    guard let jsonArray = json.array else {return models}
    for i in 0..<jsonArray.count{
      models.append(YPProjectInverstmentCellModel(jsonArray[i]))
    }
    return models
  }
  
}
