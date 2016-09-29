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
    return cell;
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
    return button
  }()
  
  fileprivate lazy var containerView:UIView = {
    let _containerView = UIView()
    _containerView.backgroundColor = UIColor.white
    return _containerView
  }()
  
  fileprivate lazy var shadowView:UIView = {
    let _shadowView = UIView()
    _shadowView.backgroundColor = UIColor.colorWithHex(hex: 0x000000, alpha: 0.15)
    return _shadowView
  }()
  
  fileprivate lazy var collectionView:UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let itemSizeWidth = 125
    let itemSizeHeight = 100
    layout.itemSize = CGSize(width: itemSizeWidth, height: itemSizeHeight)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    let frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 200)
    let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.register(NSClassFromString("PropertyExchange.YPFilterCollectionViewCell"), forCellWithReuseIdentifier: "PropertyExchange.YPFilterCollectionViewCell")
    collectionView.dataSource = self
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
    
    
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.createSubviews()
    self.createLayoutConstains()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  

}
