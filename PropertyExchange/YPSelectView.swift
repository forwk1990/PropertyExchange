//
//  YPSelectView.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/14.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPSelectView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.white
    self.createSubviews()
    self.createLayoutConstrains()
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open lazy var titleLabel:UILabel = {
    let _titleLabel = UILabel()
    _titleLabel.font = UIFont.systemFont(ofSize: 14)
    _titleLabel.textColor = UIColor.colorWithHex(hex: 0x999999)
    _titleLabel.textAlignment = .left
    return _titleLabel
  }()
  
  open lazy var valueLabel:UILabel = {
    let _valueLabel = UILabel()
    _valueLabel.font = UIFont.systemFont(ofSize: 14)
    _valueLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
    return _valueLabel
  }()
  
  open lazy var indicatorView:UIImageView = {
    let _indicatorView = UIImageView()
    _indicatorView.image = UIImage(named: "arrow_right")
    return _indicatorView
  }()
  
  fileprivate func createSubviews(){
    self.addSubview(self.titleLabel)
    self.addSubview(self.valueLabel)
    self.addSubview(self.indicatorView)
  }
  
  fileprivate func createLayoutConstrains(){
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.centerY.equalTo(self)
      make.left.equalTo(self).offset(12)
    }
    
    self.indicatorView.snp.makeConstraints { (make) in
      make.centerY.equalTo(self)
      make.right.equalTo(self).offset(-12)
    }
    
    self.valueLabel.snp.makeConstraints { (make) in
      make.centerY.equalTo(self)
      make.right.equalTo(self.indicatorView.snp.left).offset(-12)
    }
    
  }
  
}
