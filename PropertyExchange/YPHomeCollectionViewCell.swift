//
//  YPHomeCollectionViewCell.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/28.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPHomeCollectionViewCell: UICollectionViewCell
{
  fileprivate lazy var imageView:UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  fileprivate lazy var label:UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = UIColor.colorWithHex(hex: 0x39404D)
    label.textAlignment = .center
    return label
  }()
  
  func createSubviews(){
    self.addSubview(self.imageView)
    self.addSubview(self.label)
  }
  
  func createLayoutConstains(){
    
    self.imageView.snp.makeConstraints { (make) in
      make.width.height.equalTo(32)
      make.centerX.equalTo(self)
      make.top.equalTo(self).offset(22)
    }
    
    self.label.snp.makeConstraints { (make) in
      make.centerX.equalTo(self)
      make.top.equalTo(self.imageView.snp.bottom).offset(10)
    }
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.createSubviews()
    self.createLayoutConstains()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var model:(title:String,image:String,controller:UIViewController.Type)?{
    didSet{
      guard let _model = self.model else {
        return
      }
      
      self.imageView.image = UIImage(named: _model.image)
      self.label.text = _model.title
    }
  }
  
}
