//
//  YPSelectBankCardTableViewCell.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/14.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPSelectBankCardTableViewCell: UITableViewCell {
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  public class func cell(withTableView tableView:UITableView, forReuseIdentifier reuseIdentifier:String) -> UITableViewCell?{
    var tableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if(tableViewCell == nil){
      tableViewCell = YPSelectBankCardTableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: reuseIdentifier)
      tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.none
    }
    tableViewCell?.contentView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return tableViewCell
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.textLabel?.font = UIFont.systemFont(ofSize: 14)
    self.textLabel?.textColor = UIColor.colorWithHex(hex: 0x333333)
    self.separatorInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
    self.contentView.addSubview(valueLabel)
  }
  
  open lazy var valueLabel:UILabel = {
    let _valueLabel = UILabel()
    _valueLabel.font = UIFont.systemFont(ofSize: 14)
    _valueLabel.textColor = UIColor.colorWithHex(hex: 0x333333)
    _valueLabel.textAlignment = .right
    return _valueLabel
  }()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    
    
    self.contentView.snp.makeConstraints { (make) in
      make.top.left.equalTo(self).offset(18)
      make.right.bottom.equalTo(self).offset(-18)
    }
    
    self.imageView?.snp.makeConstraints { (make) in
      make.width.height.equalTo(32)
    }
    
    self.textLabel?.snp.makeConstraints({ (make) in
      make.centerY.equalTo(self.contentView)
      make.height.equalTo(14)
      make.left.equalTo((self.imageView?.snp.right)!).offset(10)
    })
    
    self.valueLabel.snp.makeConstraints({ (make) in
      make.centerY.equalTo(self.contentView)
      make.right.equalTo(self.contentView)
      make.height.equalTo(14)
    })
    
  }
  
  
}
