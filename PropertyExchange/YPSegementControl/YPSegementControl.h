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
- (void)segementControl:(YPSegementControl *)segementControl willDisplayView:(UIView *)view atIndex:(NSUInteger)index;
- (void)segementControl:(YPSegementControl *)segementControl didDisplayView:(UIView *)view atIndex:(NSUInteger)index;
- (void)segementControl:(YPSegementControl *)segementControl didSelectItemAtIndex:(NSUInteger)index;

@required

- (NSUInteger)numberOfItemsIn:(YPSegementControl *)segementControl;
- (CGSize)sizeOfItemIn:(YPSegementControl *)segementControl;
- (UIView *)segementControl:(YPSegementControl *)segementControl viewForItemAtIndex:(NSUInteger)index;

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
@property (nonatomic, assign) CGFloat containerCornerRadius;
@property (nonatomic, assign) UIEdgeInsets containerInsets;
@property (nonatomic, strong) UIColor *containerBackgroundColor;

@property (nonatomic, weak) id<YPSegementControlDelegate> delegate;

@end
