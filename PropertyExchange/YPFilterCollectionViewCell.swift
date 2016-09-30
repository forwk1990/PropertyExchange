//
//  YPFilterCollectionViewCell.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/29.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPFilterCollectionViewCell: UICollectionViewCell {
  
  public var isChecked:Bool = false {
    didSet{
      if self.isChecked{
        self.filterItemLabel.layer.borderWidth = 2
        self.filterItemLabel.backgroundColor = UIColor.clear
        self.filterItemLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
      }else{
        self.filterItemLabel.layer.borderWidth = 0
        self.filterItemLabel.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
        self.filterItemLabel.textColor = UIColor.colorWithHex(hex: 0x999999)
      }
    }
  }
  
  fileprivate lazy var filterItemLabel:UILabel = {
    let _label = UILabel()
    _label.textColor = UIColor.colorWithHex(hex: 0x999999)
    _label.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    _label.layer.borderColor = UIColor.colorWithHex(hex: 0x39404D).cgColor
    _label.font = UIFont.systemFont(ofSize: 14)
    _label.textAlignment = .center
    return _label
  }()
  
  public var model:String? {
    didSet{
      guard let _model = self.model else {return}
      self.filterItemLabel.text = _model
    }
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    self.contentView.addSubview(self.filterItemLabel)
    self.filterItemLabel.snp.makeConstraints { (make) in
      make.top.left.right.bottom.equalTo(self.contentView)
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
