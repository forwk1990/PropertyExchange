//
//  YPSegementCollectionViewLabelCell.h
//  PropertyExchange
//
//  Created by itachi on 16/10/12.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPSegementCollectionViewCell.h"

@interface YPSegementCollectionViewLabelCell : YPSegementCollectionViewCell

@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) UIFont *font;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,assign) UIFont *selectedFont;
@property (nonatomic,strong) UIColor *selectedTextColor;

@end
