//
//  YPGestureVerifyViewController.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/13.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

extension YPGestureVerifyViewController:CircleViewDelegate{
  
  func circleView(_ view: PCCircleView, type: CircleViewType, didCompleteLoginGesture gesture: String, result equal: Bool) {
    if type == .verify {
      if equal {
        
      }
    }
  }
  
}

class YPGestureVerifyViewController: UIViewController {
  
  fileprivate let lockPassword = "1235789"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 保存手势密码
    PCCircleViewConst.saveGesture(self.lockPassword, key: gestureOneSaveKey)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  fileprivate func createSubviews(){
    
    self.view.addSubview(self.weekLabel)
    self.view.addSubview(self.dateLabel)
    
    self.view.addSubview(self.userLogoImageView)
    self.view.addSubview(self.helloMessageLabel)
    
    self.view.addSubview(self.lockView)
    self.view.addSubview(self.lockLabel)
    self.view.addSubview(self.forgetGesturePasswordButton)
    self.view.addSubview(self.separatorLineView)
    self.view.addSubview(self.otherLoginButton)
    
  }
  
  fileprivate func createLayoutSubviews(){
    
    self.weekLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.view).offset(18)
      make.top.equalTo(self.view).offset(28)
    }
    
    self.dateLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.weekLabel)
      make.top.equalTo(self.weekLabel.snp.bottom).offset(6)
    }
    
    self.userLogoImageView.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.view)
      make.width.height.equalTo(64)
      make.top.equalTo(self.view).offset(143)
    }
    
    self.helloMessageLabel.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.userLogoImageView)
      make.top.equalTo(self.userLogoImageView.snp.bottom).offset(10)
    }
    
    self.
    
  }
  
  fileprivate lazy var weekLabel:UILabel = {
    let weekFormatter:DateFormatter = DateFormatter()
    weekFormatter.locale = Locale(identifier: "zh_CN")
    weekFormatter.dateFormat = "cccc"
    
    let _weekLabel = UILabel();
    _weekLabel.textAlignment = .left
    _weekLabel.text = weekFormatter.string(from: Date())
    _weekLabel.font = UIFont.boldSystemFont(ofSize: 18)
    _weekLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
    return _weekLabel
  }()
  
  fileprivate lazy var dateLabel:UILabel = {
    let dateFormatter:DateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "zh_CN")
    dateFormatter.dateFormat = "yyyy.MM.dd"
    
    let _dateLabel = UILabel()
    _dateLabel.font = UIFont.systemFont(ofSize: 12)
    _dateLabel.text = dateFormatter.string(from: Date())
    _dateLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
    _dateLabel.textAlignment = .left
    return _dateLabel
  }()
  
  fileprivate lazy var userLogoImageView:UIImageView = {
    let _logoImageView = UIImageView()
    _logoImageView.image = UIImage(named: "userLogo")
    return _logoImageView
  }()
  
  fileprivate lazy var helloMessageLabel:UILabel = {
    let _helloMessageLabel = UILabel()
    _helloMessageLabel.font = UIFont.systemFont(ofSize: 12)
    _helloMessageLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
    return _helloMessageLabel
  }()

  fileprivate lazy var lockView:PCCircleView = {
    let _lockView = PCCircleView(type: CircleViewType.verify, clip: true, arrow: false)
    _lockView.delegate = self
    return _lockView
  }()
  
  fileprivate lazy var lockLabel:PCLockLabel = {
    let _lockLabel = PCLockLabel()
    return _lockLabel
  }()
  
  fileprivate lazy var forgetGesturePasswordButton:UIButton = {
    let _forgetGesturePasswordButton = UIButton(type: .custom)
    _forgetGesturePasswordButton.setTitleColor(UIColor.colorWithHex(hex: 0x999999), for: .normal)
    _forgetGesturePasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    _forgetGesturePasswordButton.setTitle("忘记手势密码", for: .normal)
    return _forgetGesturePasswordButton
  }()
  
  fileprivate lazy var separatorLineView:UIView = {
    let _separatorLineView = UIView()
    _separatorLineView.backgroundColor = UIColor.colorWithHex(hex: 0x999999)
    return _separatorLineView
  }()
  
  fileprivate lazy var otherLoginButton:UIButton = {
    let _otherLoginButton = UIButton(type: .custom)
    _otherLoginButton.setTitleColor(UIColor.colorWithHex(hex: 0x999999), for: .normal)
    _otherLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    _otherLoginButton.setTitle("用其它帐号登陆", for: .normal)
    return _otherLoginButton
  }()
  
  
}
