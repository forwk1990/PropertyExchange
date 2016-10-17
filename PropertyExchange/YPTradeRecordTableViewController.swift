//
//  YPTradeRecordTableViewController.swift
//  PropertyExchange
//
//  Created by 尹攀 on 16/10/16.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit
import SwiftyJSON

extension YPTradeRecordTableViewController:YPNetworkManagerDelegate
{
  @available(iOS 2.0, *)
  public func networkManager(_ manager: YPNetworkManager!, successResponseObject responseObject: NSObject!) {
    guard let _responseObject = responseObject else {return}
    guard let code = JSON.init(_responseObject).dictionary?["Code"] , code == 0 else{return}
    guard let data = JSON.init(_responseObject).dictionary?["Data"] else{return}
    self.models = YPTradeRecord.models(json: data)
  }
  
  func requestUrl() -> String! {
    return "trade_list"
  }
  
  func parameters() -> [String : Any]! {
    return ["user":"" as AnyObject]
  }
  
  
  func networkManager(_ manager: YPNetworkManager!, failureResponseError error: Error!) {
    
  }
}

class YPTradeRecordTableViewController: UITableViewController {
  private let networkManager:YPNetworkManager = YPNetworkManager.default()!
  
  fileprivate var models:[YPTradeRecord]?{
    didSet{
      guard let _models = self.models , _models.count > 0 else{return}
      self.tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setNavigationBar()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    self.tableView.rowHeight = 60
    
    self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0.01))
    self.tableView.register(YPTradeRecordTableViewCell.self, forCellReuseIdentifier: YPTradeRecordTableViewCell.className())
    
    self.networkManager.delegate = self
    self.networkManager.sendRequest()
  }
  
  private func setNavigationBarStyle(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(color:UIColor.white), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.colorWithHex(hex: 0xDCDCDC))
    self.navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  private func setNavigationBar(){
    self.setNavigationBarStyle()
    
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0xf5f5f5)
    self.title = "交易记录"
    
    let backButton = UIButton(type: .custom)
    backButton.addTarget(self, action:#selector(self.backButtonTouched(sender:)), for: .touchUpInside)
    backButton.setImage(UIImage(named: "后退"), for: .normal)
    backButton.sizeToFit()
    let leftBarButton = UIBarButtonItem(customView: backButton)
    self.navigationItem.leftBarButtonItem = leftBarButton
    
  }
  
  @objc private func backButtonTouched(sender:UIButton){
    _ = self.navigationController?.popViewController(animated: true)
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
    guard let _models = self.models else {
      return 0
    }
    return _models.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:YPTradeRecordTableViewCell = YPTradeRecordTableViewCell.cell(withTableView:tableView,forReuseIdentifier:YPTradeRecordTableViewCell.className()) as! YPTradeRecordTableViewCell
    guard let _model = self.models?[indexPath.row] else {
      return cell
    }
    cell.selectionStyle = .none
    cell.imageView?.image = _model.isOut ? UIImage(named: "支出") : UIImage(named: "收入")
    cell.textLabel?.text = "¥ \(String.decimalString(from: _model.money))"
    cell.categoryLabel.text = _model.desc
    cell.dateLabel.text = _model.date
    return cell
  }
  
  /*
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
   
   // Configure the cell...
   
   return cell
   }
   */
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
