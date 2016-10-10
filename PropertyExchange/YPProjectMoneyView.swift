//
//  YPProjectMoneyView.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/10.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

extension YPProjectMoneyView:UITableViewDataSource
{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let _bankCell = YPBankTableViewCell(frame: CGRect.zero)
    _bankCell.model = (title:"中信银行（尾号8387）",controller:YPProjectInverstmentViewController.self,detail:"单笔限额1万元, 单日限额1万",image:"中信")
    return _bankCell
  }
}

class YPProjectMoneyView: UIView
{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.isUserInteractionEnabled = true
    self.addGestureRecognizer(UITapGestureRecognizer(actionBlock: { (recognizer) in
      self.moneyTextField.resignFirstResponder()
    }))
    
    self.createSubviews()
    self.createLayoutConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate var isDisplay:Bool = false
  
  public func show(){
    
    if isDisplay == false{
      let appDelegate = UIApplication.shared.delegate as? AppDelegate
      appDelegate?.window.bringSubview(toFront: self)
      
      UIView.animate(withDuration: 0.3) {
        self.contentContainerView.transform = CGAffineTransform(translationX: 0, y: 224-ScreenHeight);
        self.shadowView.alpha = 0.3
      }
      isDisplay = true
    }
    
  }
  
  public func hide(){
    
    if isDisplay{
      UIView.animate(withDuration: 0.3, animations: {
        self.contentContainerView.transform = CGAffineTransform.identity
        self.shadowView.alpha = 0.0
        }, completion: { (finish) in
          if finish{
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.window.sendSubview(toBack: self)
          }
      })
      isDisplay = false
    }
    
  }
  
  public func toggleDisplay(){
    if isDisplay{
      self.hide()
    }else{
      self.show()
    }
  }
  
  @objc private func submitButtonTouched(sender:UIButton){
    
    if let money = self.moneyTextField.text , money.isEmpty == false{
      self.moneyTextField.resignFirstResponder()
      self.toggleDisplay()
    }else{
      
    }
    
  }
  
  @objc private func closeButtonTouched(sender:UIButton){
    self.toggleDisplay()
  }
  
  public var model:YPProjectInverstmentCellModel?{
    didSet{
      guard let _model = self.model else {
        return
      }
      
      self.rangeLabel.text = "可投范围  ¥\(String.decimalString(from:Float(_model.min))) ~ ¥ \(String.decimalString(from:Float(_model.max)))"
    }
  }
  
  fileprivate lazy var shadowView:UIView = {
    let _shadowView = UIView()
    _shadowView.backgroundColor = UIColor.colorWithHex(hex: 0x000000)
    _shadowView.alpha = 0
    _shadowView.isUserInteractionEnabled = true
    _shadowView.addGestureRecognizer(UITapGestureRecognizer(actionBlock: { (recognizer) in
      
    }))
    return _shadowView
  }()
  
  fileprivate lazy var contentContainerView:UIView = {
    let _contentContainerView = UIView()
    _contentContainerView.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    return _contentContainerView
  }()
  
  fileprivate lazy var headerContainerView:UIView = {
    let _headerContainerView = UIView()
    _headerContainerView.backgroundColor = UIColor.colorWithHex(hex: 0x39404D)
    return _headerContainerView
  }()
  
  fileprivate lazy var bottomContainerView:UIView = {
    let _bottomContainerView = UIView()
    return _bottomContainerView
  }()
  
  fileprivate lazy var rangeLabel:UILabel = {
    let _rangeLabel = UILabel()
    _rangeLabel.font = UIFont.systemFont(ofSize: 14)
    _rangeLabel.textColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return _rangeLabel
  }()
  
  fileprivate lazy var closeButton:UIButton = {
    let _closeButton = UIButton(type: .custom)
    _closeButton.setImage(UIImage(named:"关闭"), for: .normal)
    _closeButton.addTarget(self, action: #selector(closeButtonTouched(sender:)), for: .touchUpInside)
    return _closeButton
  }()
  
  lazy var tableView:UITableView = {
    let _tableView = UITableView(frame:CGRect.zero, style:.plain)
    _tableView.register(UITableViewCell.self, forCellReuseIdentifier: YPProjectMoneyView.className())
    _tableView.dataSource = self
    _tableView.rowHeight = 60
    _tableView.sectionHeaderHeight = 10
    _tableView.separatorStyle = .none
    _tableView.showsVerticalScrollIndicator = false
    _tableView.showsHorizontalScrollIndicator = false
    return _tableView
  }()
  
  
  fileprivate lazy var moneyTextField:UITextField = {
    let _moneyTextField = UITextField()
    _moneyTextField.placeholder = "输入投标金额"
    _moneyTextField.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    _moneyTextField.textColor = UIColor.colorWithHex(hex: 0x999999)
    _moneyTextField.layer.borderColor = UIColor.colorWithHex(hex: 0xDDDDDD).cgColor
    _moneyTextField.layer.borderWidth = 0.5
    _moneyTextField.keyboardType = .numberPad
    
    let leftView = UIView()
    leftView.frame = CGRect(x: 0, y: 0, width: 12, height: 60)
    _moneyTextField.leftView = leftView
    _moneyTextField.leftViewMode = .always
    
    return _moneyTextField
  }()
  
  fileprivate lazy var submitButton:UIButton = {
    let _submitButton = UIButton(type: .custom)
    _submitButton.backgroundColor = UIColor.colorWithHex(hex: 0xCBA064)
    _submitButton.setTitle("确认投标", for: .normal)
    _submitButton.setTitleColor(UIColor.colorWithHex(hex: 0xFFFFFF), for: .normal)
    _submitButton.addTarget(self, action: #selector(submitButtonTouched(sender:)), for: .touchUpInside)
    return _submitButton
  }()
  
  func createSubviews(){
    self.addSubview(self.shadowView)
    self.addSubview(self.contentContainerView)
    
    self.contentContainerView.addSubview(self.headerContainerView)
    self.contentContainerView.addSubview(self.bottomContainerView)
    
    self.headerContainerView.addSubview(self.rangeLabel)
    self.headerContainerView.addSubview(self.closeButton)
    
    self.bottomContainerView.addSubview(self.tableView)
    self.bottomContainerView.addSubview(self.moneyTextField)
    self.bottomContainerView.addSubview(self.submitButton)
  }
  
  func createLayoutConstraints(){
    
    self.shadowView.snp.makeConstraints { (make) in
      make.left.top.right.bottom.equalTo(self)
    }
    
    
    self.contentContainerView.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: ScreenHeight - 224)
    
    self.headerContainerView.snp.makeConstraints { (make) in
      make.left.top.right.equalTo(self.contentContainerView)
      make.height.equalTo(44)
    }
    
    self.bottomContainerView.snp.makeConstraints { (make) in
      make.left.right.bottom.equalTo(self.contentContainerView)
      make.top.equalTo(self.headerContainerView.snp.bottom)
    }
    
    self.rangeLabel.snp.makeConstraints { (make) in
      make.centerY.equalTo(self.headerContainerView)
      make.left.equalTo(self.headerContainerView).offset(18)
      make.width.equalTo(250)
    }
    
    self.closeButton.snp.makeConstraints { (make) in
      make.centerY.equalTo(self.headerContainerView)
      make.right.equalTo(self.headerContainerView).offset(-18)
    }
    
    self.tableView.snp.makeConstraints { (make) in
      make.left.top.right.equalTo(self.bottomContainerView)
      make.height.equalTo(60)
    }
    
    self.moneyTextField.snp.makeConstraints { (make) in
      make.left.equalTo(self.bottomContainerView).offset(18)
      make.right.equalTo(self.bottomContainerView).offset(-18)
      make.top.equalTo(self.tableView.snp.bottom).offset(36)
      make.height.equalTo(50)
    }
    
    self.submitButton.snp.makeConstraints { (make) in
      make.left.right.height.equalTo(self.moneyTextField)
      make.top.equalTo(self.moneyTextField.snp.bottom).offset(18)
    }
  }
}
