//
//  YPSegementCollectionViewCell.m
//  PropertyExchange
//
//  Created by itachi on 16/10/10.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPSegementCollectionViewCell.h"

@interface YPSegementCollectionViewCell ()

@end

@implementation YPSegementCollectionViewCell

- (void)setCustomView:(UIView *)customView{
  [self.customView removeFromSuperview];
  _customView = customView;
  [self.contentView addSubview:customView];
}

- (void)layoutSubviews{
  [super layoutSubviews];
  
  self.customView.frame = self.contentView.bounds;
}

@end
