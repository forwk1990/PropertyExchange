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
  segementControl.containerBackgroundColor = UIColorHex(0xcccccc);
  segementControl.separatorColor = UIColorHex(0xffffff);
  segementControl.backgroundColor = UIColorHex(0xcccccc);
  segementControl.delegate = self;
  segementControl.frame = CGRectMake(0, 100, 375, 50);
  [self.view addSubview:segementControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YPSegementControlDelegate

- (CGSize)sizeOfItemIn:(YPSegementControl *)segementControl{
  return CGSizeMake(100, 50);
}

- (NSUInteger)numberOfItemsIn:(YPSegementControl *)segementControl{
  return 5;
}

- (UIView *)segementControl:(YPSegementControl *)segementControl viewForItemAtIndex:(NSUInteger)index{
  UILabel *label = [[UILabel alloc] init];
  label.text = @"哈佛";
  label.textColor = UIColorHex(0x000000);
  label.textAlignment = NSTextAlignmentCenter;
  label.frame = CGRectMake(0, 0, 100, 50);
  return label;
}

@end
