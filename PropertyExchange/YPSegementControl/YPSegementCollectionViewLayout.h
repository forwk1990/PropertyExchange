//
//  YPSegementCollectionViewLayout.h
//  PropertyExchange
//
//  Created by itachi on 16/10/11.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define YPSegementCollectionElementKindSeparator @"YPSegementCollectionElementKindSeparator"

@interface YPSegementCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat separatorWidth;
@property (nonatomic, assign) UIEdgeInsets separatorInsets;

@end
