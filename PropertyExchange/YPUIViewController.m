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

@property (nonatomic, strong) YPSegementControl *segementControl;

@end

@implementation YPUIViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  self.view.backgroundColor = UIColorHex(0xFFFFFF);

  YPSegementControl *segementControl = [[YPSegementControl alloc] init];
  segementControl.indicatorInsets = UIEdgeInsetsMake(0, 10, 5, 10);
  segementControl.indicatorHeight = 1;
  segementControl.containerBackgroundColor = UIColorHex(0xF3F3F3);
  segementControl.textColor = UIColorHex(0x282828);
//  segementControl.selectedTextColor = UIColorHex(0x282828);
  segementControl.fontSize = 15;
//  segementControl.selectedFontSize = 15;
  segementControl.titles = @[@"哈佛",@"牛津",@"武职",@"华科",@"武大"];
  segementControl.itemSize = CGSizeMake(115, 50);
  segementControl.containerBackgroundColor = UIColorHex(0x39404D);
  segementControl.separatorColor = UIColorHex(0x000000);
  segementControl.separatorWidth = 0.5;
  segementControl.containerCornerRadius = 10;
  segementControl.delegate = self;
//  segementControl.containerInsets = UIEdgeInsetsZero;
  segementControl.containerInsets = UIEdgeInsetsMake(15, 15, 15, 15);
  segementControl.frame = CGRectMake(0, 200, 375, 80);
  segementControl.backgroundColor = UIColorHex(0xF5F5F5);
  [self.view addSubview:segementControl];
  
  self.segementControl = segementControl;
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - YPSegementControlDelegate


@end
