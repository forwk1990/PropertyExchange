//
//  YPHomeHeaderView.m
//  PropertyExchange
//
//  Created by itachi on 16/9/28.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPHomeHeaderView.h"
#import "NSString+DecimalFormat.h"

@interface YPHomeHeaderView ()

@property (nonatomic,strong) UILabel *zhTitleLabel;
@property (nonatomic,strong) UILabel *usTitleLabel;
@property (nonatomic,strong) UILabel *totalMoneyLabel;

@end

@implementation YPHomeHeaderView

- (UILabel *)zhTitleLabel{
  if(_zhTitleLabel == nil){
    UILabel *label = [[UILabel alloc] init];
    label.text = @"资产交易平台";
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor colorWithRGB:0xFFFFFF];
    _zhTitleLabel = label;
  }
  return _zhTitleLabel;
}

- (UILabel *)usTitleLabel{
  if(_usTitleLabel == nil){
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = @"Assets Exchange Center";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor colorWithRGB:0xFFFFFF];
    _usTitleLabel = label;
  }
  return _usTitleLabel;
}

- (UILabel *)totalMoneyLabel{
  if(_totalMoneyLabel == nil){
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = [NSString stringWithFormat:@"平台已累计交易 ¥%@",[NSString decimalStringWithFloat:168888888880]];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithRGB:0xFFFFFF];
    _totalMoneyLabel = label;
  }
  return _totalMoneyLabel;
}

- (void)createSubviews{
  [self addSubview:self.zhTitleLabel];
  [self addSubview:self.usTitleLabel];
  [self addSubview:self.totalMoneyLabel];
  
}

- (void)createLayoutConstrains{
  @weakify(self)
  
  [self.zhTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    @strongify(self)
    make.left.equalTo(self).offset(18);
    make.top.equalTo(self).offset(18);
  }];
  
  [self.usTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    @strongify(self)
    make.left.equalTo(self.zhTitleLabel);
    make.top.equalTo(self.zhTitleLabel.mas_bottom).offset(5);
  }];
  
  [self.totalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.zhTitleLabel);
    make.bottom.equalTo(self).offset(-18);
  }];
}

- (instancetype)initWithFrame:(CGRect)frame{
  if(self = [super initWithFrame:frame]){
    self.backgroundColor = UIColorHex(0xC8A064);
    [self createSubviews];
    [self createLayoutConstrains];
  }
  return self;
}

@end
