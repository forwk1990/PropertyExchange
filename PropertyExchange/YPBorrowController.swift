//
//  YPBorrowController.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/14.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

extension YPBorrowController:UIPickerViewDataSource
{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 5
  }
}

extension YPBorrowController:UIPickerViewDelegate
{
  func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    let attributedString = NSAttributedString(string: self.periodsValues[row].title, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSForegroundColorAttributeName:UIColor.black])
    return attributedString
  }
  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 40
  }
}

extension YPBorrowController:YPSelectBankCardViewControllerDelegate
{
  func selectBankCardViewController(_ controller: YPSelectBankCardViewController, didSelect bank: (String, String)) {
    self.bankSelectView.valueLabel.text = "\(bank.0)(尾号\(bank.1))"
  }
}

extension YPBorrowController:UITextFieldDelegate
{
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    // 最多只能允许输入6位
    if moneyText.lengthOfBytes(using: String.Encoding.utf8) >= 6 {
      return false
    }

    var newMoney:String = ""
    if string.isEmpty {// 删除
      newMoney = moneyText.substring(to: moneyText.index(before: moneyText.endIndex))
    }else{ // 新增
      newMoney = moneyText.appending(string)
    }
    
    // 重新设置当前输入框的值
    textField.text = String.moneyString(from: newMoney)
    
    // 保存当前真实值
    moneyText = newMoney
    
    return false
  }
}

class YPBorrowController: UIViewController {
  
  var moneyText = ""
  var periodsValues:[(title:String,value:Float)] = [(title:String,value:Float)]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    periodsValues.append((title:"一期",value:0.15))
    periodsValues.append((title:"三期",value:0.15))
    periodsValues.append((title:"六期",value:0.15))
    periodsValues.append((title:"十二期",value:0.25))
    periodsValues.append((title:"二十四期",value:0.5))
    
    
    
    self.createSubviews()
    self.createLayoutSubviews()
    self.setNavigationBar()
    
    self.view.addSubview(self.periodsValuePickerView)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.moneyTextField.becomeFirstResponder()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  private func setNavigationBarStyle(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(color:UIColor.white), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.colorWithHex(hex: 0xDCDCDC))
    self.navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  private func setNavigationBar(){
    self.setNavigationBarStyle()
    
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0xf5f5f5)
    self.title = "我要借款"
    
    let backButton = UIButton(type: .custom)
    backButton.addTarget(self, action:#selector(self.backButtonTouched(sender:)), for: .touchUpInside)
    backButton.setImage(UIImage(named: "后退"), for: .normal)
    backButton.sizeToFit()
    let leftBarButton = UIBarButtonItem(customView: backButton)
    self.navigationItem.leftBarButtonItem = leftBarButton
    
  }
  
  @objc private func backButtonTouched(sender:UIButton){
    _ = self.navigationController?.popViewController(animated: true)
  }
  
  fileprivate func createSubviews(){
    self.view.addSubview(self.moneyContainer)
    self.moneyContainer.addSubview(self.moneyLabel)
    self.moneyContainer.addSubview(self.moneyTextField)
    
    self.view.addSubview(self.bankSelectView)
    self.view.addSubview(self.periodsSelectView)
    self.view.addSubview(self.feeLabel)
    self.view.addSubview(self.feeRateLabel)
    self.view.addSubview(self.submitButton)
  }
  
  fileprivate func createLayoutSubviews(){
    self.moneyContainer.snp.makeConstraints { (make) in
      make.top.left.equalTo(self.view).offset(18)
      make.right.equalTo(self.view).offset(-18)
      make.height.equalTo(100)
    }
    
    self.moneyLabel.snp.makeConstraints { (make) in
      make.left.top.equalTo(self.moneyContainer).offset(18)
    }
    
    self.moneyTextField.snp.makeConstraints { (make) in
      make.bottom.equalTo(self.moneyContainer)
      make.left.equalTo(self.moneyContainer).offset(18)
      make.right.equalTo(self.moneyContainer).offset(-18)
      make.height.equalTo(60)
    }
    
    self.bankSelectView.snp.makeConstraints { (make) in
      make.left.right.equalTo(self.moneyContainer)
      make.height.equalTo(50)
      make.top.equalTo(self.moneyContainer.snp.bottom).offset(18)
    }
    
    self.periodsSelectView.snp.makeConstraints { (make) in
      make.left.right.height.equalTo(self.bankSelectView)
      make.top.equalTo(self.bankSelectView.snp.bottom).offset(18)
    }
    
    self.feeLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.periodsSelectView)
      make.top.equalTo(self.periodsSelectView.snp.bottom).offset(10)
    }
    
    self.feeRateLabel.snp.makeConstraints { (make) in
      make.right.equalTo(self.periodsSelectView)
      make.top.equalTo(self.feeLabel)
    }
    
    self.submitButton.snp.makeConstraints { (make) in
      make.top.equalTo(self.periodsSelectView.snp.bottom).offset(54)
      make.left.right.equalTo(self.periodsSelectView)
      make.height.equalTo(50)
    }
    
  }
  
  fileprivate lazy var periodsValuePickerView:UIPickerView = {
    let _periodsValuePickerView = UIPickerView(frame: CGRect.zero)
    let frame = CGRect(x:0, y: ScreenHeight - 200, width: ScreenWidth, height: 200)
    _periodsValuePickerView.backgroundColor = UIColor.white
    _periodsValuePickerView.frame = frame
    _periodsValuePickerView.dataSource = self
    _periodsValuePickerView.delegate = self
    return _periodsValuePickerView
  }()
  
  fileprivate lazy var moneyContainer:UIView = {
    let _moneyContainer = UIView()
    _moneyContainer.layer.borderColor = UIColor.colorWithHex(hex: 0xCCCCCC, alpha:0.5).cgColor
    _moneyContainer.layer.borderWidth = 1
    _moneyContainer.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return _moneyContainer
  }()
  
  fileprivate lazy var moneyLabel:UIView = {
    let _moneyLabel = UILabel()
    _moneyLabel.text = "输入借款金额"
    _moneyLabel.font = UIFont.systemFont(ofSize: 14)
    _moneyLabel.textColor = UIColor.colorWithHex(hex: 0x999999)
    return _moneyLabel
  }()
  
  fileprivate lazy var moneyTextField:UITextField = {
    let _moneyTextField = UITextField()
    _moneyTextField.delegate = self
    _moneyTextField.keyboardType = .numberPad
    _moneyTextField.font = UIFont.boldSystemFont(ofSize: 36)
    _moneyTextField.textColor = UIColor.colorWithHex(hex: 0x39404D)
    return _moneyTextField
  }()
  
  fileprivate lazy var bankSelectView:YPSelectView = {
    let _bankSelectView = YPSelectView()
    _bankSelectView.addGestureRecognizer(UITapGestureRecognizer(actionBlock: { (gesture) in
      self.moneyTextField.resignFirstResponder()
      
      let selectBankCardViewController = YPSelectBankCardViewController(style: .plain)
      selectBankCardViewController.delegate = self
      self.navigationController?.pushViewController(selectBankCardViewController, animated:true)
    }))
    _bankSelectView.layer.borderColor = UIColor.colorWithHex(hex: 0xCCCCCC, alpha:0.5).cgColor
    _bankSelectView.layer.borderWidth = 1
    _bankSelectView.titleLabel.text = "收款银行"
    _bankSelectView.valueLabel.text = "中信银行 (尾号8387)"
    return _bankSelectView
  }()
  
  fileprivate lazy var periodsSelectView:YPSelectView = {
    let _periodsSelectView = YPSelectView()
    _periodsSelectView.layer.borderColor = UIColor.colorWithHex(hex: 0xCCCCCC, alpha:0.5).cgColor
    _periodsSelectView.layer.borderWidth = 1
    _periodsSelectView.addGestureRecognizer(UITapGestureRecognizer(actionBlock: { (gesture) in
      self.moneyTextField.resignFirstResponder()
    }))
    _periodsSelectView.titleLabel.text = "选择期数"
    return _periodsSelectView
  }()
  
  fileprivate lazy var feeLabel:UILabel = {
    let _feeLabel = UILabel()
    _feeLabel.textAlignment = .left
    _feeLabel.text = "总手续费：0.00"
    _feeLabel.font = UIFont.systemFont(ofSize: 14)
    _feeLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
    return _feeLabel
  }()
  
  fileprivate lazy var feeRateLabel:UILabel = {
    let _feeRateLabel = UILabel()
    _feeRateLabel.text = "每期费率：％"
    _feeRateLabel.textAlignment = .right
    _feeRateLabel.font = UIFont.systemFont(ofSize: 14)
    _feeRateLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
    return _feeRateLabel
  }()
  
  fileprivate lazy var submitButton:UIButton = {
    let _submitButton = UIButton(type: .custom)
    _submitButton.backgroundColor = UIColor.colorWithHex(hex: 0xCBA064)
    _submitButton.setTitle("确认", for: .normal)
    _submitButton.setTitleColor(UIColor.white, for: .normal)
    _submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    return _submitButton
  }()
  
  
}
