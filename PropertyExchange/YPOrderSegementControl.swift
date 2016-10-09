//
//  YPOrderSegementControl.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/29.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

enum YPOrderSegementItemOrderStatus :Int {
  case ascending = 0 // 升序
  case deascending = 1 // 降序
  case none // 不排序
}

class YPOrderSegementItem:UIView{
  
  private var type:YPOrderSegementItemOrderStatus = .ascending

  public lazy var titleLabel:UILabel = {
    let _titleLabel = UILabel()
    _titleLabel.textAlignment = .center
    _titleLabel.font = UIFont.systemFont(ofSize: 14)
    return _titleLabel
  }()
  
  private lazy var upImageView:UIImageView = {
    let _imageView = UIImageView()
    _imageView.image = UIImage(named:"up")
    return _imageView
  }()
  
  private lazy var downImageView:UIImageView = {
    let _imageView = UIImageView()
    _imageView.image = UIImage(named:"down")
    return _imageView
  }()
  
  init(frame: CGRect, title:String, type:YPOrderSegementItemOrderStatus) {
    super.init(frame: frame)
    
    self.type = type
    self.titleLabel.text = title
    
    self.createSubviews()
    self.createLayoutSubviews()
  }
  
  public var isSelected:Bool = false{
    didSet{
      
    }
  }
  
  func createSubviews(){
    self.addSubview(self.titleLabel)
    self.addSubview(self.upImageView)
    self.addSubview(self.downImageView)
  }
  
  func createLayoutSubviews(){
    if self.type == .none{
      self.titleLabel.snp.makeConstraints({ (make) in
        make.top.left.bottom.right.equalTo(self)
      })
    }else{
      
      self.titleLabel.sizeToFit()
      self.titleLabel.snp.makeConstraints({ (make) in
        make.height.equalTo(14)
        make.centerY.equalTo(self)
        make.centerX.equalTo(self).offset(-7)
      })
      
      self.upImageView.snp.makeConstraints({ (make) in
        make.top.equalTo(self.titleLabel).offset(2)
        make.left.equalTo(self.titleLabel.snp.right).offset(5)
        make.width.equalTo(8)
        make.height.equalTo(4)
      })
      
      self.downImageView.snp.makeConstraints({ (make) in
        make.bottom.equalTo(self.titleLabel).offset(-2)
        make.left.equalTo(self.upImageView)
        make.width.equalTo(8)
        make.height.equalTo(4)
      })
    }
  }
  
  convenience override init(frame: CGRect) {
    self.init(frame:frame,title:"",type:.ascending)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func toggleOrderStatus(){
    if self.type == .none {
      return
    }
    if self.type == .ascending{
      self.type = .deascending
      
    }
    if self.type == .deascending{
      self.type = .ascending
    }
  }
  
  
}

protocol YPOrderSegementControlDelegate:NSObjectProtocol
{
  func segementControl(segementControl:YPOrderSegementControl, didSelectedIndex index:Int, sortByStatus status:YPOrderSegementItemOrderStatus)
}

class YPOrderSegementControl: UIView {
  public var isShowIndicatorLine:Bool = true
  public var shadowBackgroundColor = UIColor.colorWithHex(hex: 0xDDDDDD)
  public var indicatorBackgroundColor = UIColor.black
  public var delegate:YPOrderSegementControlDelegate?
  public var items:[(title:String,status:YPOrderSegementItemOrderStatus)]?{
    didSet{
      guard let temp_items = self.items else{return}
      
      // 移除之前的
      for i in 0..<visibleSegementItems.count{
        visibleSegementItems[i].removeFromSuperview()
      }
      visibleSegementItems.removeAll()
      
      for i in 0..<temp_items.count{
        let segementItem = YPOrderSegementItem(frame:CGRect.zero,title: temp_items[i].title,type:temp_items[i].status)
        segementItem.titleLabel.textColor = self.titleColor
        self.contentView.addSubview(segementItem)
        
        visibleSegementItems.append(segementItem)
      }
      
      self.indicatorView.backgroundColor = self.indicatorBackgroundColor
      self.contentView.addSubview(self.indicatorView)
    }
  }
  
  // content view padding
  public var contentInsets:UIEdgeInsets = UIEdgeInsets.zero
  public var titleColor:UIColor = UIColor.black
  public var selectedTitleColor:UIColor = UIColor.colorWithHex(hex: 0x999999)
  public var selectedBackgroundColor:UIColor = UIColor.white
  
  private var m_previousSelectedIndex:Int = -1
  private var m_selectedIndex:Int = -1
  public var selectedIndex:Int{
    get{
      return m_selectedIndex
    }
    set{
      guard let _items = self.items else {
        return
      }
      
      guard newValue >= 0 else{return}
      guard newValue < _items.count else{return}
      
      // 将之前的颜色重置
      if self.selectedIndex >= 0{
        self.visibleSegementItems[self.selectedIndex].titleLabel.textColor = self.titleColor
      }
      
      if m_previousSelectedIndex != -1{
        self.visibleSegementItems[m_previousSelectedIndex].backgroundColor = UIColor.clear
      }
      
      m_selectedIndex = newValue
      m_previousSelectedIndex = m_selectedIndex
      self.visibleSegementItems[m_selectedIndex].backgroundColor = self.selectedBackgroundColor
      
      if self.isShowIndicatorLine{
        self.showIndicatorByPercentage(percentage: CGFloat(m_selectedIndex))
      }
      
      self.visibleSegementItems[self.selectedIndex].titleLabel.textColor = self.selectedTitleColor
      self.delegate?.segementControl(segementControl: self, didSelectedIndex: m_selectedIndex,sortByStatus: _items[self.selectedIndex].status)
    }
  }
  
  public func showIndicatorByPercentage(percentage:CGFloat){
    let indicatorWidth = self.frame.width / CGFloat(self.items!.count)
    let indicatorHeight:CGFloat = 1.5
    let indicatorOriginY = self.frame.height - indicatorHeight
    self.indicatorView.frame = CGRect(x: percentage * indicatorWidth, y: indicatorOriginY, width: indicatorWidth, height: indicatorHeight)
  }
  
  
  public lazy var contentView:UIView = {
    let m_contentView = UIView()
    m_contentView.isUserInteractionEnabled = true
    m_contentView.backgroundColor = UIColor.clear
    return m_contentView
  }()
  
  private lazy var indicatorView:UIView = {
    let m_indicatorView = UIView()
    return m_indicatorView
  }()
  
  private lazy var shadowView:UIView = {
    let _shadowView = UIView()
    _shadowView.backgroundColor = UIColor.colorWithHex(hex: 0xDDDDDD)
    return _shadowView
  }()
  
  init(_titles:[(title:String,status:YPOrderSegementItemOrderStatus)], frame:CGRect){
    super.init(frame: frame)
    self.items = _titles
    self.initialize()
  }
  
  convenience init(_items:[(title:String,status:YPOrderSegementItemOrderStatus)]){
    self.init(_titles:_items, frame:CGRect.zero)
  }
  
  convenience init(){
    self.init(_titles:[(title:String,status:YPOrderSegementItemOrderStatus)](), frame: CGRect.zero)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initialize()
  }
  
  private func initialize(){
    self.addSubview(self.contentView)
    self.contentView.addSubview(self.shadowView)
    self.contentView.addSubview(self.indicatorView)
    self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.contentViewTapRecognizerCallback(recognizer:))))
  }
  
  @objc private func contentViewTapRecognizerCallback(recognizer:UITapGestureRecognizer){
    guard let temp_items = self.items , temp_items.count > 0 else{return}
    
    let itemWidth = self.contentView.bounds.width / CGFloat(temp_items.count)
    let touchedPoint = recognizer.location(in: self.contentView)
    self.selectedIndex = Int(touchedPoint.x / itemWidth)
  }
  
  public lazy var visibleSegementItems:[YPOrderSegementItem] = {
    let _visibleSegementitems = [YPOrderSegementItem]()
    return _visibleSegementitems
  }()
  
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    // set contentview frame
    let contentViewOriginX = self.contentInsets.left
    let contentViewOriginY = self.contentInsets.top
    let contentViewWidth = self.frame.width - self.contentInsets.left - self.contentInsets.right
    let contentViewHeight = self.frame.height - self.contentInsets.top - self.contentInsets.bottom
    self.contentView.frame = CGRect(x: contentViewOriginX, y: contentViewOriginY, width: contentViewWidth, height: contentViewHeight)
    
    // set segement items
    let segementItemCount = self.visibleSegementItems.count
    let segementItemWidth:CGFloat = contentViewWidth / CGFloat(segementItemCount)
    for i in 0..<segementItemCount{
      let visibleSegementItem = self.visibleSegementItems[i]
      let segementItemOriginX:CGFloat = CGFloat(i) * segementItemWidth
      visibleSegementItem.frame = CGRect(x: segementItemOriginX, y: 0, width: segementItemWidth, height: contentViewHeight)
    }
    
    // set indicatorView
    guard self.selectedIndex >= 0 && self.selectedIndex < self.visibleSegementItems.count else{return}
    if self.isShowIndicatorLine{
      let offset:CGFloat = CGFloat(self.selectedIndex)
      let indicatorOriginX:CGFloat = offset * segementItemWidth
      let indicatorOriginY:CGFloat = contentViewHeight - 1.5
      self.indicatorView.frame = CGRect(x: indicatorOriginX, y: indicatorOriginY, width: segementItemWidth, height: 1.5)
    }
    
    self.shadowView.frame = CGRect(x: 0, y: self.frame.height - 1.5, width: self.frame.width, height: 1.5)
    
  }
}
