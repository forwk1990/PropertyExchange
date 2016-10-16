//
//  YPTradeRecordTableViewCell.swift
//  PropertyExchange
//
//  Created by 尹攀 on 16/10/16.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPTradeRecordTableViewCell: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.contentView.addSubview(self.dateLabel)
    self.contentView.addSubview(self.categoryLabel)
    
  }
  
  public class func cell(withTableView tableView:UITableView, forReuseIdentifier reuseIdentifier:String) -> UITableViewCell?{
    var tableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if(tableViewCell == nil){
      tableViewCell = YPTradeRecordTableViewCell(style: .subtitle,reuseIdentifier: reuseIdentifier)
      tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.none
      
    }
    tableViewCell?.contentView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    tableViewCell?.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return tableViewCell
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open lazy var dateLabel:UILabel = {
    let _dateLabel = UILabel()
    _dateLabel.font = UIFont.systemFont(ofSize: 12)
    _dateLabel.textColor = UIColor.colorWithHex(hex: 0x999999)
    return _dateLabel
  }()
  
  open lazy var categoryLabel:UILabel = {
    let _valueLabel = UILabel()
    _valueLabel.font = UIFont.systemFont(ofSize: 12)
    _valueLabel.textColor = UIColor.colorWithHex(hex: 0x999999)
    _valueLabel.textAlignment = .right
    return _valueLabel
  }()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.imageView?.snp.makeConstraints({ (make) in
      make.centerY.equalTo(self.contentView)
      make.left.equalTo(self.contentView).offset(18)
      make.width.height.equalTo(18)
    })
    
    self.textLabel?.snp.makeConstraints({ (make) in
      make.centerY.equalTo(self.contentView)
      make.left.equalTo((self.imageView?.snp.right)!).offset(10)
    })
    
    self.categoryLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.contentView).offset(15)
      make.left.equalTo(self.contentView.snp.centerX)
    }
    
    self.dateLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.categoryLabel)
      make.top.equalTo(self.categoryLabel.snp.bottom).offset(6)
    }
    
  }
}
