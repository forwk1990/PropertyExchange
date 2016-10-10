//
//  YPProjectDetailViewController.swift
//  PropertyExchange
//
//  Created by itachi on 16/10/9.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

extension YPProjectDetailViewController:UITableViewDataSource,UITableViewDelegate
{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: YPProjectDetailViewController.className(), for: indexPath)
    cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
    cell.textLabel?.textColor = UIColor.colorWithHex(hex: 0x999999)
    let valueLabel = UILabel()
    valueLabel.frame = CGRect(x: 0, y: 0, width: 0.5 * ScreenWidth, height: 44)
    valueLabel.font = UIFont.systemFont(ofSize: 14)
    valueLabel.textColor = UIColor.colorWithHex(hex: 0x39404D)
    valueLabel.textAlignment = .right
    cell.accessoryType = .none
    cell.accessoryView = valueLabel
    if indexPath.row == 0 {
      cell.textLabel?.text = "借款期限"
      valueLabel.text = self.model?.deadline
    }else if indexPath.row == 1{
      cell.textLabel?.text = "还款方式"
      valueLabel.text = self.model?.payingWay
    }else if indexPath.row == 2{
      cell.textLabel?.text = "借款人"
      valueLabel.text = self.model?.borrower
    }else{
      cell.textLabel?.text = "可投范围"
      valueLabel.text = "¥ \((self.model?.min)!) ~ ¥ \((self.model?.max)!)"
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 10)
    view.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
    return view
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let contentOffset:CGPoint = scrollView.contentOffset
    if contentOffset.y >= 0{
      self.navigationBarBackgroundView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 64)
      // 变化区间
      if contentOffset.y < 160{
        
      }else{
        
      }
    }else{
      self.navigationBarBackgroundView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 64 - contentOffset.y)
    }
    
  }
  
  
}

class YPProjectDetailViewController: UIViewController
{
  
  public var model:YPProjectInverstmentCellModel?{
    didSet{
      self.tableHeaderView.model = self.model
      self.tenderView.model = self.model
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.createSubviews()
    self.createLayoutConstains()
    self.setNavigationBar()
    
    self.automaticallyAdjustsScrollViewInsets = false
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    appDelegate?.window.addSubview(self.tenderView)
    appDelegate?.window.sendSubview(toBack: self.tenderView)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.setNavigationBarStyle()
  }
  
  private func setNavigationBarStyle(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0xF5F5F5)
  }
  
  private func setNavigationBar(){
    self.setNavigationBarStyle()
    
    let titleLabel = UILabel()
    titleLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
    titleLabel.text = "项目详情"
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.systemFont(ofSize: 15)
    titleLabel.textColor = UIColor.colorWithHex(hex: 0xFFFFFF)
    self.navigationItem.titleView = titleLabel
    
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
  
  fileprivate lazy var tableHeaderView:YPProjectDetailHeaderView = {
    let _tableHeaderView = YPProjectDetailHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 248))
    return _tableHeaderView
  }()
  
  lazy var navigationBarBackgroundView:UIView = {
    let _navigationBarBackgroundView = UIView()
    _navigationBarBackgroundView.backgroundColor = UIColor.colorWithHex(hex: 0x39404D)
    return _navigationBarBackgroundView
  }()
  
  lazy var tableView:UITableView = {
    let frame = CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 50)
    let _tableView = UITableView(frame:frame, style:.plain)
    _tableView.tableHeaderView = self.tableHeaderView
    _tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0.01))
    _tableView.register(UITableViewCell.self, forCellReuseIdentifier: YPProjectDetailViewController.className())
    _tableView.dataSource = self
    _tableView.delegate = self
    _tableView.rowHeight = 44
    _tableView.sectionHeaderHeight = 10
    _tableView.showsVerticalScrollIndicator = false
    _tableView.showsHorizontalScrollIndicator = false
    return _tableView
  }()
  
  lazy var bottomView:UIView = {
    let _bottomView = UIView()
    _bottomView.backgroundColor = UIColor.white
    _bottomView.layer.shadowColor = UIColor.colorWithHex(hex: 0x999999).cgColor
//    _bottomView.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: ScreenWidth, height: 50)).cgPath
    _bottomView.layer.shadowOffset = CGSize(width: 0, height: -2)
    _bottomView.layer.shadowOpacity = 0.15
    _bottomView.layer.shadowRadius = 2
    return _bottomView
  }()
  
  lazy var countDownLabel:UILabel = {
    let _countDownLabel = UILabel()
    _countDownLabel.textAlignment = .center
    _countDownLabel.font = UIFont.systemFont(ofSize: 14)
    _countDownLabel.textColor = UIColor.colorWithHex(hex: 0x000000)
    let stringValue:String = "距离结束 30 天 22 小时"
    var textAttributed = NSMutableAttributedString(string: stringValue, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14)])
    textAttributed.addAttributes([NSForegroundColorAttributeName:UIColor.colorWithHex(hex: 0xCBA064)], range: NSRange(location: 5, length: 2))
    textAttributed.addAttributes([NSForegroundColorAttributeName:UIColor.colorWithHex(hex: 0xCBA064)], range: NSRange(location: 10, length: 2))
    _countDownLabel.attributedText = textAttributed
    return _countDownLabel
  }()
  
  lazy var tenderButton:UIButton = {
    let _tenderButton = UIButton(type: .custom)
    _tenderButton.setTitle("立即投标", for: .normal)
    _tenderButton.setTitleColor(UIColor.colorWithHex(hex: 0xFFFFFF), for: .normal)
    _tenderButton.backgroundColor = UIColor.colorWithHex(hex: 0xC8A064)
    _tenderButton.addTarget(self, action: #selector(tenderButtonTouched(sender:)), for: .touchUpInside)
    return _tenderButton
  }()
  
  fileprivate lazy var tenderView:YPProjectMoneyView = {
    let _tenderView = YPProjectMoneyView(frame: UIScreen.main.bounds)
    return _tenderView
  }()
  
  @objc fileprivate func tenderButtonTouched(sender:UIButton){
    self.tenderView.toggleDisplay()
  }
  
  func createSubviews(){
    
    self.view.addSubview(self.tableView)
    self.view.addSubview(self.navigationBarBackgroundView)
    self.view.addSubview(self.bottomView)
    
    self.bottomView.addSubview(self.countDownLabel)
    self.bottomView.addSubview(self.tenderButton)
  }
  
  func createLayoutConstains(){
    
    self.navigationBarBackgroundView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 64)
    
    self.bottomView.snp.makeConstraints { (make) in
      make.left.right.bottom.equalTo(self.view)
      make.height.equalTo(50)
    }
    self.countDownLabel.snp.makeConstraints { (make) in
      make.left.top.bottom.equalTo(self.bottomView)
      make.width.equalTo(235)
    }
    self.tenderButton.snp.makeConstraints { (make) in
      make.top.right.bottom.equalTo(self.bottomView)
      make.width.equalTo(140)
    }
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
