//
//  YPSegementControl.h
//  PropertyExchange
//
//  Created by itachi on 16/10/10.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YPSegementControl;

@protocol YPSegementControlDelegate <NSObject>

@optional
- (void)segementControl:(YPSegementControl *)segementControl viewForItemAtIndex:(NSUInteger)index;

@required
- (void)segementControl:(YPSegementControl *)segementControl didSelectItemAtIndex:(NSUInteger)index;

@end

@interface YPSegementControl : UIControl

@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, assign, getter=isSeparatorVisible) BOOL separatorVisible;
@property (nonatomic, assign) UIColor *separatorColor;
@property (nonatomic, assign) CGFloat separatorWidth;
@property (nonatomic, assign) UIEdgeInsets separatorInsets;

@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) UIEdgeInsets indicatorInsets;

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat contentCornerRadius;
@property (nonatomic, assign) UIEdgeInsets contentInsets;
@property (nonatomic, strong) UIColor *contentBackgroundColor;

@property (nonatomic, weak) id<YPSegementControlDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *>*)titles;

@end
