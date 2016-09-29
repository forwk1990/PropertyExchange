//
//  YPHomeTableViewCell.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/28.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit
import SnapKit

class YPHomeTableViewCell: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.createSubviews()
    self.createLayoutConstraints()
  }
  
  public class func cell(withTableView tableView:UITableView, forReuseIdentifier reuseIdentifier:String) -> UITableViewCell?{
    var tableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if(tableViewCell == nil){
      tableViewCell = YPHomeTableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: reuseIdentifier)
      tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.none
    }
    tableViewCell?.contentView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return tableViewCell
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createSubviews(){
    self.contentView.addSubview(self.titleImageView)
    self.contentView.addSubview(self.titleLabel)
    self.contentView.addSubview(self.titleDetailLabel)
    self.contentView.addSubview(self.indicatorImageView)
    
  }
  
  private func createLayoutConstraints(){
    
    self.titleImageView.snp.makeConstraints { (make) -> Void in
      make.width.height.equalTo(40)
      make.left.top.equalTo(self.contentView).offset(18)
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
  
  lazy var titleImageView:UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  lazy var titleLabel:UILabel = {
    let label = UILabel()
    label.textColor = UIColor.colorWithHex(hex: 0x39404D)
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()
  
  lazy var titleDetailLabel:UILabel = {
    let label = UILabel()
    label.textColor = UIColor.colorWithHex(hex: 0x999999)
    label.font = UIFont.systemFont(ofSize: 14)
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
}

extension YPHomeTableViewCell
{
  
}
