//
//  YPSelectBankCardViewController.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/14.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

protocol YPSelectBankCardViewControllerDelegate:NSObjectProtocol
{
  func selectBankCardViewController(_ controller:YPSelectBankCardViewController, didSelect bank:(String,String));
}

class YPSelectBankCardViewController: UITableViewController
{
  
  open var delegate:YPSelectBankCardViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setNavigationBar()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    self.tableView.rowHeight = 60
    
    self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0.01))
    self.tableView.register(YPSelectBankCardTableViewCell.self, forCellReuseIdentifier: YPSelectBankCardTableViewCell.className())
  }
  
  private func setNavigationBarStyle(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(color:UIColor.white), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.colorWithHex(hex: 0xDCDCDC))
    self.navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  private func setNavigationBar(){
    self.setNavigationBarStyle()
    
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0xf5f5f5)
    self.title = "选择银行帐户"
    
    let backButton = UIButton(type: .custom)
    backButton.addTarget(self, action:#selector(self.backButtonTouched(sender:)), for: .touchUpInside)
    backButton.setImage(UIImage(named: "后退"), for: .normal)
    backButton.sizeToFit()
    let leftBarButton = UIBarButtonItem(customView: backButton)
    self.navigationItem.leftBarButtonItem = leftBarButton
    
  }
  
  @objc private func backButtonTouched(sender:UIButton){
    self.navigationController?.popViewController(animated: true)
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
    let cell:YPSelectBankCardTableViewCell = YPSelectBankCardTableViewCell.cell(withTableView:tableView,forReuseIdentifier:YPSelectBankCardTableViewCell.className()) as! YPSelectBankCardTableViewCell
    cell.selectionStyle = .none
    if indexPath.row == 0 {
      cell.imageView?.image = UIImage(named: "ccb")
      cell.textLabel?.text = "中国建设银行"
      cell.valueLabel.text = "6222 *** 8222"
    }else if indexPath.row == 1{
      cell.imageView?.image = UIImage(named: "招商")
      cell.textLabel?.text = "招商银行"
      cell.valueLabel.text = "4232 *** 8888"
    }else{
      cell.imageView?.image = UIImage(named: "中信")
      cell.textLabel?.text = "中信银行"
      cell.valueLabel.text = "4033 *** 8387"
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      self.delegate?.selectBankCardViewController(self, didSelect: ("中国建设银行","8222"))
    }else if indexPath.row == 1{
      self.delegate?.selectBankCardViewController(self, didSelect: ("招商银行","8888"))
    }else{
      self.delegate?.selectBankCardViewController(self, didSelect: ("中信银行","8387"))
    }
    self.navigationController?.popViewController(animated: true)
    
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
