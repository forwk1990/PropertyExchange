//
//  YPInvestmentManageViewController.swift
//  PropertyExchange
//
//  Created by 尹攀 on 16/10/16.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

import UIKit

class YPRightManageViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setNavigationBar()
    self.view.addSubview(self.nothingView)
  }
  
  
  private func setNavigationBarStyle(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(color:UIColor.white), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.colorWithHex(hex: 0xDCDCDC))
    self.navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  private func setNavigationBar(){
    self.setNavigationBarStyle()
    
    self.view.backgroundColor = UIColor.colorWithHex(hex: 0xf5f5f5)
    self.automaticallyAdjustsScrollViewInsets = false
    //self.edgesForExtendedLayout = UIRectEdge.top
    self.title = "债权转让"
    
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
  
  
  lazy var nothingView:YPNothingView = {
    let _nothingView = YPNothingView()
    _nothingView.frame = CGRect(x: 0, y: -64, width: ScreenWidth, height: ScreenHeight)
    _nothingView.model = (title:"暂无债权转让项目",image:UIImage(named:"无数据")!,operationTitle:"去投资",controller:YPProjectInverstmentViewController.self)
    return _nothingView
  }()
  
}
