//
//  YPNothingView.swift
//  PropertyExchange
//
//  Created by 尹攀 on 16/10/16.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPNothingView: UIView {
  
  
  fileprivate lazy var imageView:UIImageView = {
    let _imageView = UIImageView()
    return _imageView
  }()
  
  fileprivate lazy var titleLabel:UILabel = {
    let _titleLabel = UILabel()
    _titleLabel.textColor = UIColor.colorWithHex(hex: 0x999999)
    _titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
    return _titleLabel
  }()
  
  fileprivate lazy var operationButton:UIButton = {
    let _operationButton = UIButton(type: .custom)
    _operationButton.setTitleColor(UIColor.colorWithHex(hex: 0xFFFFFF), for: .normal)
    _operationButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    _operationButton.backgroundColor = UIColor.colorWithHex(hex: 0xCBA064)
    _operationButton.addTarget(self, action: #selector(operationButtonTouched(sender:)), for: .touchUpInside)
    return _operationButton
  }()
  
  func operationButtonTouched(sender:UIButton){
    guard let _model = self.model else {
      return
    }
    let viewController = _model.controller.init()
    self.viewController?.navigationController?.pushViewController(viewController, animated: true)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(self.imageView)
    self.addSubview(self.titleLabel)
    self.addSubview(self.operationButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var model:(title:String,image:UIImage,operationTitle:String,controller:UIViewController.Type)?{
    didSet{
      guard let _model = self.model else {
        return
      }
      
      self.titleLabel.text = _model.title
      self.imageView.image = _model.image
      self.operationButton.setTitle(_model.operationTitle, for: .normal)
      
      if _model.title.contains("暂无债权转让项目") {
        self.operationButton.isHidden = true
      }
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.imageView.snp.makeConstraints { (make) in
      make.width.height.equalTo(160)
      make.center.equalTo(self)
    }
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.centerX.equalTo(self)
      make.bottom.equalTo(self.imageView.snp.top).offset(-20)
    }
    
    self.operationButton.snp.makeConstraints { (make) in
      make.left.equalTo(self).offset(18)
      make.right.equalTo(self).offset(-18)
      make.bottom.equalTo(self).offset(-18)
      make.height.equalTo(50)
    }
    
  }
  
}
