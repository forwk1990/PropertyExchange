//
//  YPBankTableViewCell.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/10.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPBankTableViewCell: UITableViewCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.createSubviews()
    self.createLayoutConstraints()
  }
  
  public class func cell(withTableView tableView:UITableView, forReuseIdentifier reuseIdentifier:String) -> UITableViewCell?{
    var tableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if(tableViewCell == nil){
      tableViewCell = YPBankTableViewCell(style: .default,reuseIdentifier: reuseIdentifier)
      tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.none
      
    }
    tableViewCell?.contentView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    tableViewCell?.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return tableViewCell
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  fileprivate func createSubviews(){
    
    self.contentView.addSubview(self.titleImageView)
    self.contentView.addSubview(self.titleLabel)
    self.contentView.addSubview(self.titleDetailLabel)
    self.contentView.addSubview(self.indicatorImageView)
    
  }
  
  lazy var titleImageView:UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  lazy var titleLabel:UILabel = {
    let label = UILabel()
    label.textColor = UIColor.colorWithHex(hex: 0x1C1F26)
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()
  
  lazy var titleDetailLabel:UILabel = {
    let label = UILabel()
    label.textColor = UIColor.colorWithHex(hex: 0x999999)
    label.font = UIFont.systemFont(ofSize: 10)
    return label
  }()
  
  lazy var indicatorImageView:UIImageView = {
    let imageView = UIImageView(image:UIImage(named: "right"))
    return imageView
  }()
  
  public var model:(title:String,controller:UIViewController.Type,detail:String,image:String)?{
    didSet{
      guard let _model = self.model else {
        return
      }
      self.titleImageView.image = UIImage(named: _model.image)
      self.titleLabel.text = _model.title
      self.titleDetailLabel.text = _model.detail
    }
  }
  
  fileprivate func createLayoutConstraints(){
    
    self.titleImageView.snp.makeConstraints { (make) -> Void in
      make.width.height.equalTo(32)
      make.left.equalTo(self.contentView).offset(18)
      make.centerY.equalTo(self.contentView)
    }
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.titleImageView.snp.right).offset(15)
      make.top.equalTo(self.titleImageView)
    }
    
    self.titleDetailLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.titleLabel)
      make.bottom.equalTo(self.titleImageView)
    }
    
    self.indicatorImageView.snp.makeConstraints { (make) in
      make.right.equalTo(self.contentView).offset(-18)
      make.centerY.equalTo(self.contentView)
      make.width.equalTo(10)
      make.height.equalTo(16)
    }
  }
  
  
}
