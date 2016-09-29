//
//  YPProjectInverstmentTableViewCell.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/29.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPProjectInverstmentTableViewCell: UITableViewCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.createSubviews()
    self.createLayoutConstraints()
  }
  
  public class func cell(withTableView tableView:UITableView, forReuseIdentifier reuseIdentifier:String) -> UITableViewCell?{
    var tableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if(tableViewCell == nil){
      tableViewCell = YPProjectInverstmentTableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: reuseIdentifier)
      tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.none
    }
    tableViewCell?.contentView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return tableViewCell
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var suggestImageView:UIImageView = {
    let _imageView = UIImageView()
    _imageView.image = UIImage(named:"荐")
    return _imageView
  }()
  
  private lazy var titleLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x39404D))
  }()
  
  private lazy var categoryTitleLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "借款"
    return _label
  }()
  
  private lazy var totalMoneyLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
  }()
  
  private lazy var rateLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0xCBA064))
  }()
  
  private lazy var deadlineLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0xCBA064))
  }()
  
  private lazy var rateFlagLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "年化利率"
    return _label
  }()
  
  private lazy var deadlineFlagLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "借款期限"
    return _label
  }()
  
  private lazy var typeCategoryLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "按月到期还款"
    return _label
  }()
  
  private lazy var remainFlagLabel:UILabel = {
    let _label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    _label.text = "剩余"
    return _label
  }()
  
  private lazy var remainLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
  }()
  
  private lazy var containerView:UIView = {
    let _view = UIView()
    return _view
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
  
  public var model:YPProjectInverstmentCellModel?{
    didSet{
      guard let _model = self.model else {
        return
      }
      
      self.titleLabel.text = _model.title
      if(_model.isSuggest){
        self.suggestImageView.snp.remakeConstraints { (make) in
          make.top.equalTo(self.containerView).offset(13)
          make.left.equalTo(self.containerView)
          make.width.height.equalTo(14)
        }
        self.titleLabel.snp.remakeConstraints({ (make) in
          make.top.equalTo(self.containerView)
          make.height.equalTo(40)
          make.left.equalTo(self.suggestImageView.snp.right).offset(5)
        })
      }else{
        self.suggestImageView.snp.remakeConstraints { (make) in
          make.top.equalTo(self.containerView).offset(13)
          make.left.equalTo(self.containerView)
          make.width.height.equalTo(0)
        }
        self.titleLabel.snp.remakeConstraints({ (make) in
          make.top.equalTo(self.containerView)
          make.height.equalTo(40)
          make.left.equalTo(self.containerView)
        })
      }
      
      self.typeCategoryLabel.text = _model.payingWay
      self.totalMoneyLabel.text = "¥ \(_model.totalMoney)"
      self.rateLabel.text = "\(_model.rate)%"
      self.deadlineLabel.text = _model.deadline
      self.remainLabel.text = "¥\(_model.remainMoney)"
      self.circleProgress.setProgress(CGFloat(_model.remainMoney / _model.totalMoney), animated: true)
    }
  }
  
  private func createSubviews(){
    
    self.contentView.addSubview(self.containerView)
    
    self.containerView.addSubview(self.suggestImageView)
    self.containerView.addSubview(self.titleLabel)
    self.containerView.addSubview(self.categoryTitleLabel)
    self.containerView.addSubview(self.totalMoneyLabel)
    self.containerView.addSubview(self.rateLabel)
    self.containerView.addSubview(self.deadlineLabel)
    self.containerView.addSubview(self.rateFlagLabel)
    self.containerView.addSubview(self.deadlineFlagLabel)
    self.containerView.addSubview(self.typeCategoryLabel)
    self.containerView.addSubview(self.remainFlagLabel)
    self.containerView.addSubview(self.remainLabel)
    self.containerView.addSubview(self.circleProgress)
  }
  
  private func createLabel(withFont font:UIFont,andColor color:UIColor) -> UILabel{
    let _categoryTitleLabel = UILabel()
    _categoryTitleLabel.textColor = color
    _categoryTitleLabel.font = font
    return _categoryTitleLabel
  }
  
  private func createLayoutConstraints(){
    
    self.containerView.snp.makeConstraints { (make) in
      make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(0, 18, 0, 18))
    }
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.containerView)
      make.height.equalTo(40)
    }
    
    self.categoryTitleLabel.snp.makeConstraints { (make) in
      make.right.equalTo(self.containerView).offset(-100)
      make.top.equalTo(self.containerView)
      make.height.equalTo(40)
    }
    
    self.totalMoneyLabel.snp.makeConstraints { (make) in
      make.right.equalTo(self.containerView)
      make.top.equalTo(self.containerView)
      make.height.equalTo(40)
    }
    
    self.rateLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView)
      make.top.equalTo(self.titleLabel.snp.bottom)
      make.height.equalTo(20)
    }
    
    self.deadlineLabel.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.containerView)
      make.top.equalTo(self.rateLabel)
      make.height.equalTo(20)
    }
    
    self.rateFlagLabel.snp.makeConstraints { (make) in
      make.height.equalTo(20)
      make.left.equalTo(self.containerView)
      make.top.equalTo(self.rateLabel.snp.bottom)
    }
    
    self.deadlineFlagLabel.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.containerView)
      make.top.equalTo(self.deadlineLabel.snp.bottom)
      make.height.equalTo(20)
    }
    
    self.circleProgress.snp.makeConstraints { (make) in
      make.height.equalTo(40)
      make.width.equalTo(40)
      make.right.equalTo(self.containerView)
      make.top.equalTo(self.totalMoneyLabel.snp.bottom)
    }
    
    self.typeCategoryLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView)
      make.bottom.equalTo(self.containerView)
      make.height.equalTo(40)
    }
    
    self.remainFlagLabel.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.categoryTitleLabel)
      make.bottom.equalTo(self.containerView)
      make.height.equalTo(40)
    }
    
    self.remainLabel.snp.makeConstraints { (make) in
      make.right.equalTo(self.containerView)
      make.bottom.equalTo(self.containerView)
      make.height.equalTo(40)
    }
    
  }

}
