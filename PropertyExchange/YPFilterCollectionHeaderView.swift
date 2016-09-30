//
//  YPFilterCollectionHeaderView.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/30.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import Foundation


class YPFilterCollectionHeaderView:UICollectionReusableView
{
  fileprivate lazy var titleLabel:UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = UIColor.colorWithHex(hex: 0x39404D)
    label.textAlignment = .left
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(self.titleLabel)
    self.titleLabel.snp.makeConstraints { (make) in
      make.height.equalTo(self)
      make.left.equalTo(self).offset(18)
      make.top.equalTo(self)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var model:String?{
    didSet{
      guard let _model = self.model else {
        return
      }
      self.titleLabel.text = _model
    }
  }
  
}
