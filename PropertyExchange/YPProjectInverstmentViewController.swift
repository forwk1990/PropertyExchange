//
//  YPProjectInverstmentViewController.swift
//  PropertyExchange
//
//  Created by itachi on 16/9/29.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit
import SwiftyJSON


extension YPProjectInverstmentViewController:YPNetworkManagerDelegate
{
  @available(iOS 2.0, *)
  public func networkManager(_ manager: YPNetworkManager!, successResponseObject responseObject: NSObject!) {
    guard let _responseObject = responseObject else {return}
    guard let code = JSON.init(_responseObject).dictionary?["Code"] , code == 0 else{return}
    guard let data = JSON.init(_responseObject).dictionary?["Data"] else{return}
    self.models = YPProjectInverstmentCellModel.models(json: data)
  }

  func requestUrl() -> String! {
    return "project_inverstment_list"
  }
  
  func parameters() -> [String : Any]! {
    return ["user":"" as AnyObject]
  }
  
  
  func networkManager(_ manager: YPNetworkManager!, failureResponseError error: Error!) {
    
  }
}

extension YPProjectInverstmentViewController:UITableViewDataSource,UITableViewDelegate
{
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.models?.count ?? 0
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let commentCell = YPProjectInverstmentTableViewCell.cell(withTableView: tableView, forReuseIdentifier: YPProjectInverstmentViewController.className()) as! YPProjectInverstmentTableViewCell
    commentCell.selectionStyle = .none
    return commentCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailController = YPProjectDetailViewController()
    detailController.model = self.models?[indexPath.row]
    self.navigationController?.pushViewController(detailController, animated: true)
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let commentCell:YPProjectInverstmentTableViewCell = cell as! YPProjectInverstmentTableViewCell
    commentCell.model = self.models![indexPath.row]
  }
  
}

class YPProjectInverstmentViewController: UIViewController {
  
  private lazy var segementControl:YPOrderSegementControl = {
    var segementItems = [(title:String,status:YPOrderSegementItemOrderStatus)]()
    segementItems.append((title:"综合",status:.none))
    segementItems.append((title:"利率",status:.ascending))
    segementItems.append((title:"期限",status:.ascending))
    segementItems.append((title:"金额",status:.ascending))
    segementItems.append((title:"进度",status:.ascending))
    let _segementControl = YPOrderSegementControl()
    _segementControl.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    _segementControl.selectedBackgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    _segementControl.titleColor = UIColor.colorWithHex(hex: 0x999999)
    _segementControl.selectedTitleColor = UIColor.black
    _segementControl.items = segementItems
    _segementControl.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 44)
    _segementControl.selectedIndex = 0
    return _segementControl
  }()
  
  private lazy var filterView:YPFilterView = {
    let _filterView = YPFilterView(frame: UIScreen.main.bounds)
    return _filterView
  }()
  
  private let networkManager:YPNetworkManager = YPNetworkManager.default()!
  private lazy var tableView: UITableView = {
    var tableView = UITableView(frame: CGRect(x: 0, y: 44, width: ScreenWidth, height: ScreenHeight - 64 - 44))
    tableView.register(YPProjectInverstmentTableViewCell.self, forCellReuseIdentifier: YPProjectInverstmentViewController.className())
    tableView.rowHeight = 120
    tableView.allowsSelection = true
    tableView.separatorStyle = .singleLine
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = UIColor.colorWithHex(hex: 0xF3F3F3)
    tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0.01))
    tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0.01))
    tableView.showsVerticalScrollIndicator = false
    return tableView
  }()
  
  fileprivate var models:[YPProjectInverstmentCellModel]?{
    didSet{
      guard let _models = self.models , _models.count > 0 else{return}
      self.tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setNavigationBar()
    
    self.view.addSubview(self.segementControl)
    self.view.addSubview(self.tableView)
    //self.view.addSubview(self.filterView)
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    appDelegate?.window.addSubview(self.filterView)
    appDelegate?.window.sendSubview(toBack: self.filterView)
    
    
    self.networkManager.delegate = self
    self.networkManager.sendRequest()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.setNavigationBarStyle()
  }
  
  private func setNavigationBarStyle(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(color:UIColor.white), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.colorWithHex(hex: 0xDCDCDC))
    self.navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  private func setNavigationBar(){
    self.setNavigationBarStyle()
    
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    self.title = "项目投资"
    
    let backButton = UIButton(type: .custom)
    backButton.addTarget(self, action:#selector(self.backButtonTouched(sender:)), for: .touchUpInside)
    backButton.setImage(UIImage(named: "后退"), for: .normal)
    backButton.sizeToFit()
    let leftBarButton = UIBarButtonItem(customView: backButton)
    self.navigationItem.leftBarButtonItem = leftBarButton
    
    let filterButton = UIButton(type: .custom)
    filterButton.addTarget(self, action: #selector(self.filterButtonTouched(sender:)), for: .touchUpInside)
    filterButton.setImage(UIImage(named: "筛选"), for: .normal)
    filterButton.sizeToFit()
    let rightSearchBarButton = UIBarButtonItem(customView: filterButton)
    self.navigationItem.rightBarButtonItem = rightSearchBarButton
    
  }
  
  @objc private func backButtonTouched(sender:UIButton){
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc private func filterButtonTouched(sender:UIButton){
    self.filterView.toggleDisplay()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
