//
//  YPFilterView.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/29.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

extension YPFilterView:UICollectionViewDataSource
{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.filterModels[section].items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyExchange.YPFilterCollectionViewCell", for: indexPath) as! YPFilterCollectionViewCell
    cell.model = self.filterModels[indexPath.section].items[indexPath.row]
    //cell.isChecked = false
    return cell;
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    if kind == UICollectionElementKindSectionHeader{
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: YPFilterCollectionHeaderView.className(), for: indexPath)
      headerView.setValue(self.filterModels[indexPath.section].title, forKey: "model")
      return headerView
    }
    
    return UICollectionReusableView()
  }
  
}

extension YPFilterView:UICollectionViewDelegate
{
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! YPFilterCollectionViewCell
    cell.isChecked = !cell.isChecked
  }
}

class YPFilterView: UIView
{

  fileprivate lazy var filterModels:[(title:String,items:[String])] = {
    var _manageModels = [(title:String,items:[String])]()
    _manageModels.append((title:"还款方式",items:["按月分期","按季分期","按月到期","按天一次性还款","按天计算利息"]))
    _manageModels.append((title:"借款期限",items:["30天内","1个月","1-3个月","3-6个月","6-12个月","12个月以上"]))
    _manageModels.append((title:"标的类型",items:["净","快","仪","荐","秒","特"]))
    return _manageModels
  }()
  
  fileprivate lazy var submitButton:UIButton = {
    let button = UIButton(type: .custom)
    button.backgroundColor = UIColor.colorWithHex(hex: 0xC8A064)
    button.setTitle("确定", for: .normal)
    button.setTitleColor(UIColor.colorWithHex(hex: 0xFFFFFF), for: .normal)
    button.addTarget(self, action: #selector(self.submitButtonTouched(sender:)), for: .touchUpInside)
    return button
  }()
  
  fileprivate lazy var containerView:UIView = {
    let _containerView = UIView()
    _containerView.backgroundColor = UIColor.white
    return _containerView
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
  
  fileprivate lazy var collectionView:UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let itemSizeWidth = (ScreenWidth - 40 - 36 - 10) * 0.5
    let itemSizeHeight:CGFloat = 44.0
    layout.itemSize = CGSize(width: itemSizeWidth, height: itemSizeHeight)
    layout.headerReferenceSize = CGSize(width: ScreenWidth, height: 44)
    layout.minimumInteritemSpacing = 10
    layout.minimumLineSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
    
    let frame = CGRect(x: 0, y: 0, width: ScreenWidth - 40, height: ScreenHeight)
    let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.register(NSClassFromString("PropertyExchange.YPFilterCollectionViewCell"), forCellWithReuseIdentifier: "PropertyExchange.YPFilterCollectionViewCell")
    collectionView.register(YPFilterCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: YPFilterCollectionHeaderView.className())
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return collectionView
  }()
  
  fileprivate func createSubviews(){
    self.addSubview(self.shadowView)
    
    self.addSubview(self.containerView)
    self.containerView.addSubview(self.collectionView)
    self.containerView.addSubview(self.submitButton)
  }
  
  fileprivate func createLayoutConstains(){
    
    self.containerView.frame = CGRect(x: self.frame.width, y: 0, width: self.frame.width - 40, height: self.frame.height)
    
    self.shadowView.snp.makeConstraints { (make) in
      make.edges.equalTo(self)
    }
    
    self.collectionView.snp.makeConstraints { (make) in
      make.edges.equalTo(self.containerView).inset(UIEdgeInsetsMake(20, 0, 0, 0))
    }
    
    self.submitButton.snp.makeConstraints { (make) in
      make.left.bottom.right.equalTo(self.containerView)
      make.height.equalTo(50)
    }
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.createSubviews()
    self.createLayoutConstains()
  }
  
  fileprivate var isDisplay:Bool = false
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func show(){
    
    if isDisplay == false{
      let appDelegate = UIApplication.shared.delegate as? AppDelegate
      appDelegate?.window.bringSubview(toFront: self)
      
      UIView.animate(withDuration: 0.3) {
        self.containerView.transform = CGAffineTransform(translationX: -self.containerView.frame.width, y: 0);
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
  
  public func toggleDisplay(){
    if isDisplay{
      self.hide()
    }else{
      self.show()
    }
  }
  
  @objc private func submitButtonTouched(sender:UIButton){
    self.toggleDisplay()
  }

}
