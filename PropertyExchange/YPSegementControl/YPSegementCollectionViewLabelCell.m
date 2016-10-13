//
//  YPSegementCollectionViewLabelCell.m
//  PropertyExchange
//
//  Created by itachi on 16/10/12.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPSegementCollectionViewLabelCell.h"

@interface YPSegementCollectionViewLabelCell ()

@property (nonatomic,strong) UILabel *label;

@end

@implementation YPSegementCollectionViewLabelCell

- (instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    self.label = [[UILabel alloc] init];
    self.customView = self.label;
    self.label.textAlignment = NSTextAlignmentCenter;
  }
  return self;
}

- (void)setText:(NSString *)text{
  self.label.text = text;
}

- (NSString *)text{
  return self.label.text;
}

- (void)setTextColor:(UIColor *)textColor{
  self.label.textColor = textColor;
}

- (UIColor *)textColor{
  return self.label.textColor;
}

- (void)setFont:(UIFont *)font{
  self.label.font = font;
}

- (UIFont *)font{
  return self.label.font;
}


@end
