//
//  YPProfileViewController.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/30.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPProfileViewController: UIViewController {
  
  fileprivate lazy var headerView:UIView = {
    let _headerView = UIView()
    _headerView.backgroundColor = UIColor.colorWithHex(hex: 0x4B5566)
    return _headerView
  }()
  
  fileprivate lazy var titleLabel:UILabel = {
    let _titleLabel = UILabel()
    _titleLabel.font = UIFont.systemFont(ofSize: 14)
    _titleLabel.textColor = UIColor.white
    _titleLabel.text = "账户总览"
    return _titleLabel
  }()
  
  fileprivate lazy var settingButton:UIButton = {
    let _settingButton = UIButton(type: .custom)
    _settingButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    _settingButton.setTitle("设置", for: .normal)
    _settingButton.setTitleColor(UIColor.white, for: .normal)
    return _settingButton
  }()
  
  fileprivate lazy var userImageShadowView:UIView = {
    let _userImageShadowView = UIView()
    _userImageShadowView.layer.cornerRadius = 42
    _userImageShadowView.clipsToBounds = true
    _userImageShadowView.backgroundColor = UIColor.colorWithHex(hex: 0x464f5e)
    return _userImageShadowView
  }()
  
  fileprivate lazy var userImageView:UIImageView = {
    let _userImageView = UIImageView()
    _userImageView.image = UIImage(named:"荐")
    _userImageView.layer.cornerRadius = 37
    _userImageView.clipsToBounds = true
    _userImageView.layer.borderWidth = 5
    _userImageView.layer.borderColor = UIColor.colorWithHex(hex: 0x404857).cgColor
    return _userImageView
  }()
  
  fileprivate lazy var userNameLabel:UILabel = {
    let _userNameLabel = UILabel()
    _userNameLabel.font = UIFont.systemFont(ofSize: 14)
    _userNameLabel.textColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    _userNameLabel.text = "王建林"
    return _userNameLabel
  }()
  
  fileprivate lazy var totalMoneyFlagLabel:UILabel = {
    let _totalMoneyLabel = UILabel()
    _totalMoneyLabel.font = UIFont.systemFont(ofSize: 16)
    _totalMoneyLabel.textColor = UIColor.colorWithHex(hex: 0x4b5566)
    _totalMoneyLabel.text = "账户总额:"
    return _totalMoneyLabel
  }()

  fileprivate lazy var earningsFlagLabel:UILabel = {
    let _earningsFlagLabel = UILabel()
    _earningsFlagLabel.font = UIFont.systemFont(ofSize: 16)
    _earningsFlagLabel.textColor = UIColor.colorWithHex(hex: 0x4b5566)
    _earningsFlagLabel.text = "累计收益:"
    return _earningsFlagLabel
  }()
  
  fileprivate lazy var remainMoneyFlagLabel:UILabel = {
    let _remainMoneyFlagLabel = UILabel()
    _remainMoneyFlagLabel.font = UIFont.systemFont(ofSize: 16)
    _remainMoneyFlagLabel.textColor = UIColor.colorWithHex(hex: 0x4b5566)
    _remainMoneyFlagLabel.text = "可用余额:"
    return _remainMoneyFlagLabel
  }()
  
  fileprivate lazy var totalMoneyLabel:UILabel = {
    let _totalMoneyLabel = UILabel()
    _totalMoneyLabel.font = UIFont.systemFont(ofSize: 16)
    _totalMoneyLabel.textColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    let stringValue:String = "948,080.21  元"
    var textAttributed = NSMutableAttributedString(string: stringValue, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16)])
    textAttributed.addAttributes([NSForegroundColorAttributeName:UIColor.colorWithHex(hex: 0x4B5566)], range: NSRange(location: stringValue.lengthOfBytes(using: String.Encoding.utf8) - 3, length: 1))
    _totalMoneyLabel.attributedText = textAttributed
    return _totalMoneyLabel
  }()
  
  fileprivate lazy var earningsLabel:UILabel = {
    let _earningsFlagLabel = UILabel()
    _earningsFlagLabel.font = UIFont.systemFont(ofSize: 16)
    _earningsFlagLabel.textColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    let stringValue:String = "663,030.21  元"
    var textAttributed = NSMutableAttributedString(string: stringValue, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16)])
    textAttributed.addAttributes([NSForegroundColorAttributeName:UIColor.colorWithHex(hex: 0x4B5566)], range: NSRange(location: stringValue.lengthOfBytes(using: String.Encoding.utf8) - 3, length: 1))
    _earningsFlagLabel.attributedText = textAttributed
    return _earningsFlagLabel
  }()
  
  fileprivate lazy var remainMoneyLabel:UILabel = {
    let _remainMoneyFlagLabel = UILabel()
    _remainMoneyFlagLabel.font = UIFont.systemFont(ofSize: 16)
    _remainMoneyFlagLabel.textColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    let stringValue:String = "648,080.21  元"
    var textAttributed = NSMutableAttributedString(string: stringValue, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16)])
    textAttributed.addAttributes([NSForegroundColorAttributeName:UIColor.colorWithHex(hex: 0x4B5566)], range: NSRange(location: stringValue.lengthOfBytes(using: String.Encoding.utf8) - 3, length: 1))
    _remainMoneyFlagLabel.attributedText = textAttributed
    return _remainMoneyFlagLabel
  }()
  
  fileprivate lazy var chargeMoneyButton:UIButton = {
    let _chargeMoneyButton = UIButton(type: .custom)
    _chargeMoneyButton.backgroundColor = UIColor.colorWithHex(hex: 0xCBA064)
    _chargeMoneyButton.setTitle("充值", for: .normal)
    _chargeMoneyButton.setTitleColor(UIColor.white, for: .normal)
    _chargeMoneyButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    return _chargeMoneyButton
  }()
  
  fileprivate lazy var withdrawButton:UIButton = {
    let _withdrawButton = UIButton(type: .custom)
    _withdrawButton.backgroundColor = UIColor.colorWithHex(hex: 0x4B5566)
    _withdrawButton.setTitle("提现", for: .normal)
    _withdrawButton.setTitleColor(UIColor.white, for: .normal)
    _withdrawButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    return _withdrawButton
  }()
  
  private func createSubviews(){
    self.view.addSubview(self.headerView)
    
    self.headerView.addSubview(self.titleLabel)
    self.headerView.addSubview(self.settingButton)
    self.headerView.addSubview(self.userImageShadowView)
    self.headerView.addSubview(self.userImageView)
    self.headerView.addSubview(self.userNameLabel)
    
    self.view.addSubview(self.totalMoneyFlagLabel)
    self.view.addSubview(self.earningsFlagLabel)
    self.view.addSubview(self.remainMoneyFlagLabel)
    
    self.view.addSubview(self.totalMoneyLabel)
    self.view.addSubview(self.remainMoneyLabel)
    self.view.addSubview(self.earningsLabel)
    
    self.view.addSubview(self.chargeMoneyButton)
    self.view.addSubview(self.withdrawButton)
  }
  
  private func createLayoutSubviews(){
    
    self.headerView.snp.makeConstraints { (make) in
      make.left.top.right.equalTo(self.view)
      make.height.equalTo(222)
    }
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.headerView).offset(18)
      make.top.equalTo(self.headerView).offset(36)
    }
    
    self.settingButton.snp.makeConstraints { (make) in
      make.top.equalTo(self.titleLabel)
      make.right.equalTo(self.headerView).offset(-18)
    }
    
    self.userImageShadowView.snp.makeConstraints { (make) in
      make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
      make.centerX.equalTo(self.headerView)
      make.width.height.equalTo(84)
    }
    self.userImageView.snp.makeConstraints { (make) in
      make.center.equalTo(self.userImageShadowView)
      make.width.height.equalTo(74)
    }
    self.userNameLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.userImageShadowView.snp.bottom).offset(10)
      make.centerX.equalTo(self.userImageShadowView)
    }
    
    self.totalMoneyFlagLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.headerView.snp.bottom).offset(50)
      make.left.equalTo(self.view).offset(18)
    }
    
    self.earningsFlagLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.totalMoneyFlagLabel.snp.bottom).offset(20)
      make.left.equalTo(self.view).offset(18)
    }
    
    self.remainMoneyFlagLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.earningsFlagLabel.snp.bottom).offset(40)
      make.left.equalTo(self.view).offset(18)
    }
    
    //
    
    self.totalMoneyLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.totalMoneyFlagLabel)
      make.right.equalTo(self.view).offset(-18)
    }
    
    self.remainMoneyLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.earningsFlagLabel)
      make.right.equalTo(self.totalMoneyLabel)
    }
    
    self.earningsLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.remainMoneyFlagLabel)
      make.right.equalTo(self.totalMoneyLabel)
    }
    
    self.withdrawButton.snp.makeConstraints { (make) in
      make.bottom.right.equalTo(self.view).offset(-18)
      make.left.equalTo(self.view).offset(18)
      make.height.equalTo(50)
    }
    
    self.chargeMoneyButton.snp.makeConstraints { (make) in
      make.bottom.equalTo(self.withdrawButton.snp.top).offset(-18)
      make.right.equalTo(self.view).offset(-18)
      make.left.equalTo(self.view).offset(18)
      make.height.equalTo(50)
    }
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0x39404D)
    self.createSubviews()
    self.createLayoutSubviews()
    self.setNavigationBar()
  }
  
  private func setNavigationBar(){
    
    //self.view.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
