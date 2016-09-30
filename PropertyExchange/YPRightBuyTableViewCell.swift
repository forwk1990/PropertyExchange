//
//  YPRightBuyTableViewCell.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/30.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPRightBuyTableViewCell: UITableViewCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.createSubviews()
    self.createLayoutConstraints()
  }
  
  public class func cell(withTableView tableView:UITableView, forReuseIdentifier reuseIdentifier:String) -> UITableViewCell?{
    var tableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if(tableViewCell == nil){
      tableViewCell = YPRightBuyTableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: reuseIdentifier)
      tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.none
    }
    tableViewCell?.contentView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return tableViewCell
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func createSubviews(){
    
    self.contentView.addSubview(self.containerView)
    
    self.containerView.addSubview(self.suggestImageView)
    self.containerView.addSubview(self.titleLabel)
    self.containerView.addSubview(self.totalMoneyLabel)
    self.containerView.addSubview(self.rateLabel)
    self.containerView.addSubview(self.deadlineLabel)
    self.containerView.addSubview(self.totalMoneyFlagLabel)
    self.containerView.addSubview(self.rateFlagLabel)
    self.containerView.addSubview(self.deadlineFlagLabel)
    self.containerView.addSubview(self.originTotalMoneyLabel)
    self.containerView.addSubview(self.originTotalMoneyFlagLabel)
    self.containerView.addSubview(self.originRateLabel)
    self.containerView.addSubview(self.originRateFlagLabel)
    self.containerView.addSubview(self.originDeadlineLabel)
    self.containerView.addSubview(self.originDeadlineFlagLabel)
    
    self.containerView.addSubview(self.horizontalLineView)
    self.containerView.addSubview(self.verticalLineView1)
    self.containerView.addSubview(self.verticalLineView2)
    
  }
  
  fileprivate func createLayoutConstraints(){
    
    self.containerView.snp.makeConstraints { (make) in
      make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 18, 0, 18))
    }
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.containerView)
      make.height.equalTo(40)
    }
    
    self.horizontalLineView.snp.makeConstraints { (make) in
      make.centerX.equalTo(self.containerView).offset(13.5)
      make.centerY.equalTo(self.containerView.snp.top).offset(90)
      make.height.equalTo(1)
      make.width.equalTo(self.containerView)
    }
    
    self.totalMoneyLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView)
      make.top.equalTo(self.containerView).offset(46)
      make.height.equalTo(14)
      make.width.equalTo(self.containerView).dividedBy(3)
    }
    
    self.rateLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.totalMoneyLabel)
      make.centerX.equalTo(self.containerView)
      make.width.equalTo(self.totalMoneyLabel)
      make.height.equalTo(self.totalMoneyLabel)
    }
    
    self.deadlineLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.totalMoneyLabel)
      make.right.equalTo(self.containerView)
      make.width.equalTo(self.totalMoneyLabel)
      make.height.equalTo(self.totalMoneyLabel)
    }
    
    self.totalMoneyFlagLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView)
      make.top.equalTo(self.totalMoneyLabel.snp.bottom).offset(6)
      make.height.equalTo(12)
      make.width.equalTo(self.containerView).dividedBy(3)
    }
    
    self.rateFlagLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.rateLabel.snp.bottom).offset(6)
      make.centerX.equalTo(self.containerView)
      make.width.equalTo(self.totalMoneyLabel)
      make.height.equalTo(self.totalMoneyLabel)
    }
    
    self.deadlineFlagLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.deadlineLabel.snp.bottom).offset(6)
      make.right.equalTo(self.containerView)
      make.width.height.equalTo(self.totalMoneyLabel)
    }
    
    self.originTotalMoneyLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView)
      make.top.equalTo(self.horizontalLineView.snp.centerY).offset(9)
      make.height.equalTo(14)
      make.width.equalTo(self.containerView).dividedBy(3)
    }
    
    self.originTotalMoneyFlagLabel.snp.makeConstraints { (make) in
      make.left.equalTo(self.containerView)
      make.top.equalTo(self.originTotalMoneyLabel.snp.bottom).offset(6)
      make.height.equalTo(12)
      make.width.equalTo(self.containerView).dividedBy(3)
    }
    
    self.originRateLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.originTotalMoneyLabel)
      make.centerX.equalTo(self.containerView)
      make.width.equalTo(self.totalMoneyLabel)
      make.height.equalTo(self.totalMoneyLabel)
    }
    
    self.originRateFlagLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.originRateLabel.snp.bottom).offset(6)
      make.centerX.equalTo(self.containerView)
      make.width.equalTo(self.totalMoneyLabel)
      make.height.equalTo(self.totalMoneyLabel)
    }
    
    self.originDeadlineLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.originTotalMoneyLabel)
      make.right.equalTo(self.containerView)
      make.width.height.equalTo(self.totalMoneyLabel)
    }
    
    self.originDeadlineFlagLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.originDeadlineLabel.snp.bottom).offset(6)
      make.right.equalTo(self.containerView)
      make.width.height.equalTo(self.totalMoneyLabel)
    }
    
    self.verticalLineView1.snp.makeConstraints { (make) in
      make.top.equalTo(self.containerView).offset(40)
      make.bottom.equalTo(self.containerView).offset(-14)
      make.width.equalTo(1)
      make.left.equalTo(self.totalMoneyLabel.snp.right)
    }
    
    self.verticalLineView2.snp.makeConstraints { (make) in
      make.top.equalTo(self.containerView).offset(40)
      make.bottom.equalTo(self.containerView).offset(-14)
      make.width.equalTo(1)
      make.left.equalTo(self.rateLabel.snp.right)
    }
    
  }
  
  public var model:YPRightBuyTableViewCellModel?{
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
      
      self.totalMoneyLabel.text = "¥ \(String.decimalString(from: Float(_model.totalMoney)))"
      self.rateLabel.text = "\(_model.rate)%"
      self.deadlineLabel.text = _model.deadline
      self.originTotalMoneyLabel.text = "¥ \(String.decimalString(from: Float(_model.originTotalMoney)))"
      self.originRateLabel.text = "\(_model.originRate)%"
      self.originDeadlineLabel.text = _model.originDeadline
    }
  }
  
  private lazy var containerView:UIView = {
    let _view = UIView()
    return _view
  }()
  
  private lazy var suggestImageView:UIImageView = {
    let _imageView = UIImageView()
    _imageView.image = UIImage(named:"荐")
    return _imageView
  }()
  
  private lazy var titleLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x39404D))
  }()
  
  private lazy var totalMoneyLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0xCBA064))
  }()
  
  private lazy var rateLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0xCBA064))
  }()
  
  private lazy var deadlineLabel:UILabel = {
    let label = self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0xCBA064))
    label.text = "剩余期数"
    return label
  }()
  
  private lazy var totalMoneyFlagLabel:UILabel = {
    let label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    label.text = "转让总额"
    return label
  }()
  
  private lazy var rateFlagLabel:UILabel = {
    let label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    label.text = "到期净收益率"
    return label
  }()
  
  private lazy var deadlineFlagLabel:UILabel = {
    let label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    label.text = "剩余期数"
    return label
  }()
  
  private lazy var originTotalMoneyLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x999999))
  }()
  
  private lazy var originTotalMoneyFlagLabel:UILabel = {
    let label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    label.text = "原始本金"
    return label
  }()
  
  private lazy var originRateLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x999999))
  }()
  
  private lazy var originRateFlagLabel:UILabel = {
    let label = self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    label.text = "原始利率"
    return label
  }()
  
  private lazy var originDeadlineLabel:UILabel = {
    return self.createLabel(withFont:UIFont.systemFont(ofSize: 14), andColor:UIColor.colorWithHex(hex: 0x999999))
  }()
  
  private lazy var originDeadlineFlagLabel:UILabel = {
    let label =  self.createLabel(withFont:UIFont.systemFont(ofSize: 12), andColor:UIColor.colorWithHex(hex: 0x999999))
    label.text = "总期数"
    return label
  }()
  
  private lazy var horizontalLineView:UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.colorWithHex(hex: 0xEEEEEE)
    return view
  }()
  
  private lazy var verticalLineView1:UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.colorWithHex(hex: 0xEEEEEE)
    return view
  }()
  
  private lazy var verticalLineView2:UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.colorWithHex(hex: 0xEEEEEE)
    return view
  }()
  
  private func createLabel(withFont font:UIFont,andColor color:UIColor) -> UILabel{
    let _label = UILabel()
    _label.textColor = color
    _label.font = font
    _label.textAlignment = .center
    return _label
  }

}
