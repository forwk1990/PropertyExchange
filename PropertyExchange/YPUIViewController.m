//
//  YPUIViewController.m
//  PropertyExchange
//
//  Created by itachi on 16/9/28.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPUIViewController.h"
#import "YPSegementControl.h"

@interface YPUIViewController () <YPSegementControlDelegate>

@end

@implementation YPUIViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  self.view.backgroundColor = UIColorHex(0xFFFFFF);
  
  YPSegementControl *segementControl = [[YPSegementControl alloc] init];
  segementControl.titles = @[@"哈佛",@"牛津",@"武职"];
  segementControl.itemSize = CGSizeMake(90, 50);
  segementControl.containerBackgroundColor = UIColorHex(0xcccccc);
  segementControl.separatorColor = UIColorHex(0xffffff);
  segementControl.separatorWidth = 0.5;
  segementControl.containerCornerRadius = 10;
  segementControl.delegate = self;
  segementControl.containerInsets = UIEdgeInsetsMake(10, 15, 10, 15);
  segementControl.backgroundColor = UIColorHex(0x3B4F5E);
  segementControl.frame = CGRectMake(0, 100, 300, 50);
  [self.view addSubview:segementControl];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - YPSegementControlDelegate


@end
