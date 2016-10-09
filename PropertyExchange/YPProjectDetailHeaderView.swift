//
//  YPProjectDetailHeaderView.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/9.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPProjectDetailHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  
  private func createSubviews(){
    self.addSubview(topBackgroundContainerView)
    self.addSubview(bottomBackgroundContainerView)
    
    self.topBackgroundContainerView.addSubview(self.suggestImageView)
    self.topBackgroundContainerView.addSubview(self.titleLabel)
    self.topBackgroundContainerView.addSubview(self.rateFlagLabel)
    self.topBackgroundContainerView.addSubview(self.rateLabel)
    
    self.bottomBackgroundContainerView.addSubview(self.circleProgress)
    self.bottomBackgroundContainerView.addSubview(self.borrowFlagLabel)
    self.bottomBackgroundContainerView.addSubview(self.borrowLabel)
    self.bottomBackgroundContainerView.addSubview(self.horizontalLineView)
    self.bottomBackgroundContainerView.addSubview(self.remainFlagLabel)
    self.bottomBackgroundContainerView.addSubview(self.remainLabel)
  }
  
  private func createLayoutConstrains(){
    self.topBackgroundContainerView.snp.makeConstraints { (make) in
      
    }
  }
  
  private lazy var topBackgroundContainerView:UIView = {
    let _backgroundContainerView = UIView()
    _backgroundContainerView.backgroundColor = UIColor.colorWithHex(hex: 0x39404D)
    return _backgroundContainerView
  }()
  
  private lazy var bottomBackgroundContainerView:UIView = {
    let _backgroundContainerView = UIView()
    _backgroundContainerView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return _backgroundContainerView
  }()
  
  private lazy var circleProgress:CircleProgressBar = {
    let _circleProgress = CircleProgressBar()
    _circleProgress.backgroundColor = UIColor.white
    _circleProgress.startAngle = 90
    _circleProgress.progressBarWidth = 2.0
    _circleProgress.hintViewSpacing = 10
    _circleProgress.hintTextColor = UIColor.colorWithHex(hex: 0xCBA064)
    _circleProgress.hintTextFont = UIFont.systemFont(ofSize: 12)
    _circleProgress.hintViewBackgroundColor = UIColor.white
    _circleProgress.progressBarTrackColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    _circleProgress.progressBarProgressColor = UIColor.colorWithHex(hex: 0xCBA064)
    return _circleProgress
  }()
  
  private lazy var borrowFlagLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "借款金额"
    return _label
  }()
  
  private lazy var borrowLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x39404D))
  }()
  
  private lazy var remainFlagLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "剩余金额"
    return _label
  }()
  
  private lazy var horizontalLineView:UIView = {
    let _horizontalLineView = UIView()
    _horizontalLineView.backgroundColor = UIColor.colorWithHex(hex: 0x999999)
    return _horizontalLineView
  }()
  
  private lazy var remainLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x39404D))
  }()
  
  private lazy var suggestImageView:UIImageView = {
    let _imageView = UIImageView()
    _imageView.image = UIImage(named:"荐")
    return _imageView
  }()
  
  private lazy var titleLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x39404D))
  }()
  
  private func createLabel(withFont font:UIFont,andColor color:UIColor) -> UILabel{
    let _categoryTitleLabel = UILabel()
    _categoryTitleLabel.textColor = color
    _categoryTitleLabel.font = font
    return _categoryTitleLabel
  }
  
  private lazy var rateLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 36), andColor:UIColor.colorWithHex(hex: 0xCBA064))
  }()
  
  private lazy var rateFlagLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "预期年化利率"
    return _label
  }()

}
