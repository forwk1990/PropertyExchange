//
//  YPPickerView.swift
//  PropertyExchange
//
//  Created by 尹攀 on 16/10/16.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

extension YPPickerView:UIPickerViewDataSource
{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 5
  }
}

extension YPPickerView:UIPickerViewDelegate
{
  
  func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    let attributedString = NSAttributedString(string: "\(self.periodsValues[row].count)期", attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSForegroundColorAttributeName:UIColor.black])
    return attributedString
  }
  
  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 40
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.currentSelectedRowIndex = row
    self.messageLabel.text = "当前选择:\"\(self.periodsValues[row].count)期\",费率:\(self.periodsValues[row].value)%"
  }
  
}

protocol YPPickerViewDelegate:NSObjectProtocol
{
  func pickerView(_ pickerView:YPPickerView, didSelect value:(count:Int,value:Float))
}

class YPPickerView: UIView
{
  
  public var delegate:YPPickerViewDelegate?
  
  fileprivate var currentSelectedRowIndex:Int = 0
  public var currentSelectedValue:((count:Int,value:Float))?{
    get{
      guard self.periodsValues.count > self.currentSelectedRowIndex else {
        return nil
      }
      return self.periodsValues[self.currentSelectedRowIndex]
    }
  }
  
  var periodsValues:[(count:Int,value:Float)] = [(count:Int,value:Float)]()
  
  fileprivate lazy var periodsValuePickerView:UIPickerView = {
    let _periodsValuePickerView = UIPickerView(frame: CGRect.zero)
    _periodsValuePickerView.backgroundColor = UIColor.clear
    _periodsValuePickerView.showsSelectionIndicator = true
    _periodsValuePickerView.dataSource = self
    _periodsValuePickerView.delegate = self
    return _periodsValuePickerView
  }()
  
  fileprivate lazy var shadowView:UIView = {
    let _shadowView = UIView()
    _shadowView.backgroundColor = UIColor.colorWithHex(hex: 0x000000)
    _shadowView.alpha = 0
    _shadowView.isUserInteractionEnabled = true
    _shadowView.addGestureRecognizer(UITapGestureRecognizer(actionBlock: { (recognizer) in
      self.toggleDisplay()
    }))
    return _shadowView
  }()
  
  fileprivate lazy var containerView:UIView = {
    let _containerView = UIView()
    _containerView.isUserInteractionEnabled = true
    _containerView.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    return _containerView
  }()
  
  fileprivate lazy var headerContainerView:UIView = {
    let _headerContainerView = UIView()
    _headerContainerView.backgroundColor = UIColor.colorWithHex(hex: 0x39404D)
    return _headerContainerView
  }()
  
  fileprivate lazy var closeButton:UIButton = {
    let _closeButton = UIButton(type: .custom)
    _closeButton.setImage(UIImage(named:"关闭"), for: .normal)
    _closeButton.addTarget(self, action: #selector(closeButtonTouched(sender:)), for: .touchUpInside)
    return _closeButton
  }()
  
  fileprivate lazy var messageLabel:UILabel = {
    let _messageLabel = UILabel()
    _messageLabel.text = ""
    _messageLabel.font = UIFont.systemFont(ofSize: 14)
    _messageLabel.textColor = UIColor.white
    return _messageLabel
  }()
  
  fileprivate lazy var submitButton:UIButton = {
    let _submitButton = UIButton(type: .custom)
    _submitButton.setTitle("确定", for: .normal)
    _submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    _submitButton.backgroundColor = UIColor.colorWithHex(hex: 0xCBA064)
    _submitButton.addTarget(self, action: #selector(submitButtonTouched(sender:)), for: .touchUpInside)
    return _submitButton
  }()
  
  func submitButtonTouched(sender:UIButton){
    self.delegate?.pickerView(self, didSelect: self.periodsValues[self.currentSelectedRowIndex])
    self.toggleDisplay()
  }
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.isUserInteractionEnabled = true
    
    periodsValues.append((count:1,value:0.15))
    periodsValues.append((count:3,value:0.15))
    periodsValues.append((count:6,value:0.15))
    periodsValues.append((count:12,value:0.25))
    periodsValues.append((count:24,value:0.5))
    
    self.addSubview(self.shadowView)
    self.addSubview(self.containerView)
    
    self.containerView.addSubview(self.headerContainerView)
    self.containerView.addSubview(self.periodsValuePickerView)
    self.headerContainerView.addSubview(self.messageLabel)
    self.headerContainerView.addSubview(self.closeButton)
    self.containerView.addSubview(self.submitButton)
    
    
    
    self.periodsValuePickerView.selectRow(self.currentSelectedRowIndex, inComponent: 0, animated: true)
    
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
        self.containerView.transform = CGAffineTransform(translationX: 0, y: -self.containerView.frame.height);
        self.shadowView.alpha = 0.3
      }
      isDisplay = true
    }
    
  }
  
  public func hide(){
    
    if isDisplay{
      UIView.animate(withDuration: 0.3, animations: {
        self.containerView.transform = CGAffineTransform.identity
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
  
  @objc private func closeButtonTouched(sender:UIButton){
    self.toggleDisplay()
  }
  
  public func toggleDisplay(){
    
    if isDisplay{
      self.hide()
    }else{
      self.show()
    }
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.containerView.frame = CGRect(x: 0, y: ScreenHeight
      , width: ScreenWidth, height: 300)
    
    self.shadowView.snp.makeConstraints { (make) in
      make.edges.equalTo(self)
    }
    
    self.headerContainerView.snp.makeConstraints { (make) in
      make.left.top.right.equalTo(self.containerView)
      make.height.equalTo(44)
    }
    
    self.messageLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.headerContainerView).offset(10)
      make.centerY.equalTo(self.headerContainerView)
      make.height.equalTo(35)
    }
    
    self.closeButton.snp.makeConstraints { (make) in
      make.centerY.equalTo(self.headerContainerView)
      make.right.equalTo(self.headerContainerView).offset(-18)
    }
    
    self.periodsValuePickerView.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView).offset(10)
      make.right.equalTo(self.containerView).offset(-10)
      make.bottom.equalTo(self.containerView).offset(-54)
      make.top.equalTo(self.containerView).offset(44)
    }
    
    self.submitButton.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView).offset(10)
      make.right.bottom.equalTo(self.containerView).offset(-10)
      make.height.equalTo(44)
    }
    
  }
  
}
