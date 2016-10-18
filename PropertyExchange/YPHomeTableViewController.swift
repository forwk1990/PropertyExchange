//
//  YPHomeTableViewController.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/28.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

extension YPHomeTableViewController:UICollectionViewDataSource,UICollectionViewDelegate
{
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.mamageModels.count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell:YPHomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyExchange.YPHomeCollectionViewCell", for: indexPath) as! YPHomeCollectionViewCell
    cell.model = self.mamageModels[indexPath.row]
    return cell;
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let _modelItem = self.mamageModels[indexPath.row]
    let viewController = _modelItem.controller.init()
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
}

class YPHomeTableViewController: UITableViewController {
  
  fileprivate lazy var functionModels:[(title:String,controller:UIViewController.Type,detail:String,image:String)] = {
    var _functionModels = [(title:String,controller:UIViewController.Type,detail:String,image:String)]()
    _functionModels.append((title:"项目投资",controller:YPProjectInverstmentViewController.self,detail:"收益稳定 期限灵活",image:"项目投资"))
    _functionModels.append((title:"债权收购",controller:YPRightBuyViewController.self,detail:"折翼转让 流动性强",image:"债权收购"))
    _functionModels.append((title:"我要借款",controller:YPBorrowController.self,detail:"我要借款 多样偿付",image:"我要借款"))
    return _functionModels
  }()
  
  lazy var mamageModels:[(title:String,image:String,controller:UIViewController.Type)] = {
    var _manageModels = [(title:String,image:String,controller:UIViewController.Type)]()
    _manageModels.append((title:"投资管理",image:"投资管理",controller:YPInvestmentManageViewController.self))
    _manageModels.append((title:"借款管理",image:"借款管理",controller:YPBorrowManageViewController.self))
    _manageModels.append((title:"债权转让",image:"债权转让",controller:YPRightManageViewController.self))
    _manageModels.append((title:"交易记录",image:"交易记录",controller:YPTradeRecordTableViewController.self))
    _manageModels.append((title:"积分管理",image:"积分管理",controller:YPTradeRecordTableViewController.self))
    _manageModels.append((title:"自动投标",image:"自动投标",controller:YPTradeRecordTableViewController.self))
    return _manageModels
  }()
  
  fileprivate lazy var tableHeaderView:YPHomeHeaderView = {
    let headerView = YPHomeHeaderView()
    headerView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 168)
    return headerView
  }()
  
  fileprivate lazy var tableBottomView:UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let itemSizeWidth = 125
    let itemSizeHeight = 100
    layout.itemSize = CGSize(width: itemSizeWidth, height: itemSizeHeight)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    let frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 200)
    let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.register(NSClassFromString("PropertyExchange.YPHomeCollectionViewCell"), forCellWithReuseIdentifier: "PropertyExchange.YPHomeCollectionViewCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setNavigationBar()
    
    self.tableView.tableHeaderView = self.tableHeaderView
    self.tableView.tableFooterView = self.tableBottomView
    self.tableView.sectionFooterHeight = 10
    self.tableView.rowHeight = 75
    
    self.popGestureLockViewController()
  }
  
  private func popGestureLockViewController(){
    let gestureVerifyViewController = YPGestureVerifyViewController()
    self.navigationController?.present(gestureVerifyViewController, animated: true, completion: { 
      
    })
  }
  
  private func setNavigationBar(){
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    
    let moreButton = UIButton(type: .custom)
    moreButton.addTarget(self, action:#selector(self.moreButtonTouched(sender:)), for: .touchUpInside)
    moreButton.setImage(UIImage(named: "更多"), for: .normal)
    moreButton.sizeToFit()
    let leftBarButton = UIBarButtonItem(customView: moreButton)
    self.navigationItem.leftBarButtonItem = leftBarButton
    
    let messageButton = UIButton(type: .custom)
    messageButton.setImage(UIImage(named: "消息"), for: .normal)
    messageButton.sizeToFit()
    let rightSearchBarButton = UIBarButtonItem(customView: messageButton)
    self.navigationItem.rightBarButtonItem = rightSearchBarButton
    
  }
  
  @objc private func moreButtonTouched(sender:UIButton){
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    appDelegate?.drawerController.toggle(.left, animated: true, completion: { (finish) in
      
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 3
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = YPHomeTableViewCell.cell(withTableView: tableView, forReuseIdentifier: YPHomeTableViewController.className()) as! YPHomeTableViewCell
    cell.model = self.functionModels[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 10)
    view.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    return view
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let _modelItem = self.functionModels[indexPath.row]
    let viewController = _modelItem.controller.init()
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
}
