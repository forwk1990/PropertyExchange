//
//  YPSegementControl.h
//  PropertyExchange
//
//  Created by itachi on 16/10/10.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Decide how to represent the segement control item
 */
typedef NS_ENUM(NSUInteger, YPSegementControlItemType) {
  /**
   The segement control item is the type of colleciton view cell
   which is actually a collection view cell contains only a label.
   mostly use for a purely text.
   */
  YPSegementControlItemTypeDefault = 0,
  /**
   Strictly speaking! this is also a custom type. you must write a custom collection view cell。
   */
  YPSegementControlItemTypeCollectionViewCell = 1,
  /**
   A custom type,you can write a custom uiview.
   */
  YPSegementControlItemTypeCustom = 2
};

@class YPSegementControl;

@protocol YPSegementControlDelegate <NSObject>

@optional
- (void)segementControl:(YPSegementControl *)segementControl willDisplayView:(UIView *)view atIndex:(NSUInteger)index;
- (void)segementControl:(YPSegementControl *)segementControl didDisplayView:(UIView *)view atIndex:(NSUInteger)index;
- (void)segementControl:(YPSegementControl *)segementControl didSelectItemAtIndex:(NSUInteger)index;
- (UIView *)segementControl:(YPSegementControl *)segementControl viewForItemAtIndex:(NSUInteger)index;

@required

- (NSUInteger)numberOfItemsIn:(YPSegementControl *)segementControl;
- (CGSize)sizeOfItemIn:(YPSegementControl *)segementControl;

@end

@interface YPSegementControl : UIControl

@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) CGFloat selectedFontSize;
@property (nonatomic, copy) NSArray<NSString *> *titles;

@property (nonatomic, assign, getter=isSeparatorVisible) BOOL separatorVisible;
@property (nonatomic, strong) UIColor *separatorColor;
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

/**
 the default value is YPSegementControlItemTypeDefault.
 */
@property (nonatomic, assign) YPSegementControlItemType itemType;

@property (nonatomic, weak) id<YPSegementControlDelegate> delegate;


@end
