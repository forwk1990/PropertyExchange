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
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.createSubviews()
    self.createLayoutConstrains()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var model:YPProjectInverstmentCellModel?{
    didSet{
      guard let _model = self.model else {
        return
      }
      
      self.titleLabel.text = _model.title
      if(_model.isSuggest){
        self.suggestImageView.snp.makeConstraints { (make) in
          make.left.equalTo(self.topBackgroundContainerView).offset(18)
          make.top.equalTo(self.topBackgroundContainerView).offset(10)
        }
        self.titleLabel.snp.makeConstraints { (make) in
          make.top.equalTo(self.suggestImageView)
          make.left.equalTo(self.suggestImageView.snp.right).offset(5)
        }
      }else{
        self.suggestImageView.snp.remakeConstraints { (make) in
          make.top.equalTo(self.topBackgroundContainerView).offset(13)
          make.left.equalTo(self.topBackgroundContainerView)
          make.width.height.equalTo(0)
        }
        self.titleLabel.snp.makeConstraints { (make) in
          make.left.equalTo(self.topBackgroundContainerView).offset(18)
          make.top.equalTo(self.topBackgroundContainerView).offset(10)
        }
      }
      self.rateLabel.text = "\(_model.rate)%"
      self.circleProgress.setProgress(CGFloat(_model.remainMoney / _model.totalMoney), animated: true)
      self.borrowLabel.text = "¥ \(String.decimalString(from: Float(_model.totalMoney)))"
      self.remainLabel.text = "¥ \(String.decimalString(from:Float(_model.remainMoney)))"
    }
  }
  
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
    
    // 头部布局
    self.topBackgroundContainerView.snp.makeConstraints { (make) in
      make.left.top.right.equalTo(self)
      make.height.equalTo(160)
    }
    self.suggestImageView.snp.makeConstraints { (make) in
      make.left.equalTo(self.topBackgroundContainerView).offset(18)
      make.top.equalTo(self.topBackgroundContainerView).offset(10)
    }
    self.titleLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.suggestImageView)
      make.left.equalTo(self.suggestImageView.snp.right).offset(5)
    }
    self.rateFlagLabel.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.topBackgroundContainerView)
      make.top.equalTo(self.titleLabel.snp.bottom).offset(25)
    }
    self.rateLabel.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.topBackgroundContainerView)
      make.top.equalTo(self.rateFlagLabel.snp.bottom).offset(10)
    }
    
    // 底部布局
    self.bottomBackgroundContainerView.snp.makeConstraints { (make) in
      make.left.right.equalTo(self)
      make.top.equalTo(self.topBackgroundContainerView.snp.bottom)
      make.height.equalTo(88)
    }
    self.circleProgress.snp.makeConstraints { (make) in
      make.left.equalTo(self.bottomBackgroundContainerView).offset(18)
      make.centerY.equalTo(self.bottomBackgroundContainerView)
      make.width.height.equalTo(58)
    }
    self.borrowFlagLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.bottomBackgroundContainerView).offset(94)
      make.top.equalTo(self.bottomBackgroundContainerView)
      make.height.equalTo(44)
    }
    self.borrowLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.bottomBackgroundContainerView)
      make.height.equalTo(44)
      make.right.equalTo(self.bottomBackgroundContainerView).offset(-18)
    }
    self.horizontalLineView.snp.makeConstraints { (make) in
      make.centerY.equalTo(self.bottomBackgroundContainerView)
      make.height.equalTo(0.5)
      make.left.equalTo(self.borrowFlagLabel)
      make.right.equalTo(self.bottomBackgroundContainerView)
    }
    self.remainFlagLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.borrowFlagLabel)
      make.height.equalTo(44)
      make.bottom.equalTo(self.bottomBackgroundContainerView)
    }
    self.remainLabel.snp.makeConstraints { (make) in
      make.height.equalTo(44)
      make.right.equalTo(self.bottomBackgroundContainerView).offset(-18)
      make.bottom.equalTo(self.bottomBackgroundContainerView)
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
    _label.textAlignment = .left
    return _label
  }()
  
  private lazy var borrowLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x39404D))
    _label.textAlignment = .right
    return _label
  }()
  
  private lazy var remainFlagLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "剩余金额"
    _label.textAlignment = .left
    return _label
  }()
  
  private lazy var horizontalLineView:UIView = {
    let _horizontalLineView = UIView()
    _horizontalLineView.backgroundColor = UIColor.colorWithHex(hex: 0x999999)
    return _horizontalLineView
  }()
  
  private lazy var remainLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x39404D))
    _label.textAlignment = .right
    return _label
  }()
  
  private lazy var suggestImageView:UIImageView = {
    let _imageView = UIImageView()
    _imageView.image = UIImage(named:"荐")
    return _imageView
  }()
  
  private lazy var titleLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0xFFFFFF))
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
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0xFFFFFF))
    _label.text = "预期年化利率"
    return _label
  }()

}
