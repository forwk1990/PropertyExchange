//
//  YPSegementControl.m
//  PropertyExchange
//
//  Created by itachi on 16/10/10.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPSegementControl.h"
#import "YPSegementCollectionViewLayout.h"
#import "YPSegementCollectionViewCell.h"
#import "YPSegementCollectionViewLabelCell.h"

@interface YPSegementControl () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UICollectionView *containerView;
@property (nonatomic, strong) YPSegementCollectionViewLayout *containerViewLayout;
@property (nonatomic, assign) CGFloat totalContentWidth;

@end

@implementation YPSegementControl{
  @private
  BOOL _selectedTextColorSetted;
  BOOL _selectedFontSizeSetted;
}

- (instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    
    /* 
     if you don't set selectedTextColor or selectedFontSize,the field value is NO.
     */
    _selectedTextColorSetted = NO;
    _selectedFontSizeSetted = NO;
    /**
     Add an empty view to subviews of self.
     if view controller has a first subview which type is scroll view and it's automaticallyAdjustsScrollViewInsets property has a default YES value,
     UIKit will set the scroll view's content offset to -64, the layout object may will return empty collectionViewLayoutAttributes.
     In my opinion，if the collection view item is outside off the collection view, the layout will not return collectionViewLayoutAttributes.
     */
    [self addSubview:[UIView new]];
    
    [self addSubview:self.containerView];
    
    [self addSubview:self.indicatorView];
    
    // setting default value to properties
    [self initialize];
  }
  return self;
}

- (void)initialize{
  
  _textColor = [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0];
  _fontSize = 14;
  
  self.separatorVisible = YES;
  self.separatorColor = [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0];
  self.separatorWidth = 0.5;
  self.separatorInsets = UIEdgeInsetsZero;
  
  self.indicatorColor = [UIColor blackColor];
  self.indicatorHeight = 0.5;
  self.indicatorInsets = UIEdgeInsetsZero;
  
  self.borderColor = [UIColor clearColor];
  self.borderWidth = 0.0f;
  self.containerCornerRadius = 0.0f;
  self.containerBackgroundColor = [UIColor whiteColor];
  self.containerInsets = UIEdgeInsetsZero;
  
  self.itemType = YPSegementControlItemTypeDefault;
}

- (void)setSelectedFontSize:(CGFloat)selectedFontSize{
  _selectedFontSize = selectedFontSize;
  _selectedFontSizeSetted = YES;
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor{
  _selectedTextColor = selectedTextColor;
  _selectedTextColorSetted = YES;
}

- (void)setContainerBackgroundColor:(UIColor *)containerBackgroundColor{
  self.containerView.backgroundColor = containerBackgroundColor;
}

- (UIColor *)containerBackgroundColor{
  return self.containerView.backgroundColor;
}

- (void)setSeparatorWidth:(CGFloat)separatorWidth{
  self.containerViewLayout.separatorWidth = separatorWidth;
}

- (CGFloat)separatorWidth{
  return self.containerViewLayout.separatorWidth;
}

- (void)setSeparatorInsets:(UIEdgeInsets)separatorInsets{
  self.containerViewLayout.separatorInsets = separatorInsets;
}

- (UIEdgeInsets)separatorInsets{
  return self.containerViewLayout.separatorInsets;
}

- (void)setContainerCornerRadius:(CGFloat)containerCornerRadius{
  self.containerView.layer.cornerRadius = containerCornerRadius;
  self.containerView.clipsToBounds = YES;
}

- (CGFloat)containerCornerRadius{
  return self.containerView.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor{
  self.containerView.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{
  return [UIColor colorWithCGColor:self.containerView.layer.borderColor];
}

- (CGFloat)borderWidth{
  return self.containerView.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
  self.containerView.layer.borderWidth = borderWidth;
}

- (UIView *)indicatorView{
  if (_indicatorView == nil) {
    _indicatorView = [[UIView alloc] init];
  }
  return _indicatorView;
}

- (UICollectionView *)containerView{
  if (_containerView == nil) {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.containerViewLayout];
    _containerView = collectionView;
    _containerView.dataSource = self;
    _containerView.bounces = NO;
    _containerView.showsVerticalScrollIndicator = NO;
    _containerView.showsHorizontalScrollIndicator = NO;
    _containerView.delegate = self;
    [_containerView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:YPSegementCollectionElementKindSeparator withReuseIdentifier:YPSegementCollectionElementKindSeparator];
    [_containerView registerClass:[YPSegementCollectionViewLabelCell class] forCellWithReuseIdentifier:[YPSegementCollectionViewLabelCell className]];
    [_containerView registerClass:[YPSegementCollectionViewCell class] forCellWithReuseIdentifier:[YPSegementCollectionViewCell className]];
  }
  return _containerView;
}

- (UICollectionViewFlowLayout *)containerViewLayout{
  if (_containerViewLayout == nil) {
    YPSegementCollectionViewLayout *flowLayout = [[YPSegementCollectionViewLayout alloc] init];
    _containerViewLayout = flowLayout;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
  }
  return _containerViewLayout;
}

- (void)setItemSize:(CGSize)itemSize{
  _itemSize = itemSize;
  
  // set containerview layout item size
  self.containerViewLayout.itemSize = self.itemSize;
}

- (void)drawRect:(CGRect)rect{
  [super drawRect:rect];
  
  /**
   Select the collection view cell by the selected index.
   */
  [self.containerView selectItemAtIndexPath:[NSIndexPath indexPathForRow:self.selectedIndex inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

- (void)layoutSubviews{
  [super layoutSubviews];
  
  /**
   by default,the selectedTextColor value is equal to the textColor value and the selectedFontSize value is equal to the selectedTextColor value.
   */
  
  if (!_selectedTextColorSetted) {
    self.selectedTextColor = self.textColor;
  }
  
  if (!_selectedFontSizeSetted) {
    self.selectedFontSize = self.fontSize;
  }
  
  /**
   if the item type is YPSegementControlItemTypeDefault, 
   we can calculate the total content width by item size and the number of title array.
   if not, the total content width is decided by the delegate.
   So,the method of 'numberofItemsIn' is necessary。
   */
  if (self.itemType == YPSegementControlItemTypeDefault) {
    self.totalContentWidth = self.titles.count * self.itemSize.width;
  }else{
    NSAssert([self.delegate respondsToSelector:@selector(numberOfItemsIn:)], @"You must implement the method 'numberOfItemsIn:' of delegate.");
    NSUInteger numberOfItems = [self.delegate numberOfItemsIn:self];
    self.totalContentWidth = numberOfItems * self.itemSize.width;
  }
  
  CGFloat width = self.frame.size.width;
  CGFloat height = self.frame.size.height;
  
  self.containerView.frame = CGRectMake(self.containerInsets.left, self.containerInsets.top, width - (self.containerInsets.left + self.containerInsets.right), height - (self.containerInsets.top + self.containerInsets.bottom));
  self.containerView.contentSize = CGSizeMake(self.totalContentWidth, self.containerView.frame.size.height);
  
  [self setIndicatorViewFrame];
  self.indicatorView.backgroundColor = self.indicatorColor;
}

- (void)setIndicatorViewFrame{
  CGFloat indicatorWidth = self.itemSize.width - (self.indicatorInsets.left + self.indicatorInsets.right);
  CGFloat indicatorHeight = self.indicatorHeight;
  CGFloat indicatorOriginX = self.selectedIndex * self.itemSize.width + self.indicatorInsets.left + self.containerInsets.left;
  CGFloat indicatorOriginY = self.containerView.frame.origin.y + (self.itemSize.height - indicatorHeight - self.indicatorInsets.bottom);
  self.indicatorView.frame = CGRectMake(indicatorOriginX, indicatorOriginY, indicatorWidth, indicatorHeight);
}

#pragma mark UICollection View Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  if (self.itemType == YPSegementControlItemTypeDefault) {
    return self.titles != nil ? self.titles.count : 0;
  }
  return [self.delegate numberOfItemsIn:self];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  YPSegementCollectionViewCell *cell = nil;
  if (self.itemType == YPSegementControlItemTypeDefault) {
    YPSegementCollectionViewLabelCell *labelCell = [collectionView dequeueReusableCellWithReuseIdentifier:[YPSegementCollectionViewLabelCell className] forIndexPath:indexPath];
    labelCell.text = self.titles[indexPath.row];
    labelCell.textColor = self.textColor;
    labelCell.font = [UIFont systemFontOfSize:self.fontSize];
    labelCell.selectedFont = [UIFont systemFontOfSize:self.selectedFontSize];
    labelCell.selectedTextColor = self.selectedTextColor;
    cell = labelCell;
  }else if(self.itemType == YPSegementControlItemTypeCollectionViewCell){
    
  }else{
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:[YPSegementCollectionViewCell className] forIndexPath:indexPath];
    cell.customView = [self.delegate segementControl:self viewForItemAtIndex:indexPath.row];
  }
  cell.customView.frame = CGRectMake(0, 0, self.itemSize.width, self.itemSize.height);
  return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
  if (![kind isEqualToString:YPSegementCollectionElementKindSeparator]) return nil;
  
  UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:YPSegementCollectionElementKindSeparator withReuseIdentifier:YPSegementCollectionElementKindSeparator forIndexPath:indexPath];
  reusableView.backgroundColor = self.separatorColor;
  return reusableView;
}

#pragma mark UICollection View Delegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
  return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
  if (self.itemType == YPSegementControlItemTypeDefault){
    YPSegementCollectionViewLabelCell *labelCell = (YPSegementCollectionViewLabelCell*)[collectionView cellForItemAtIndexPath:indexPath];
    labelCell.selected = NO;
  }
  if ([self.delegate respondsToSelector:@selector(segementControl:didDeselectItemAtIndex:)]) {
    [self.delegate segementControl:self didDeselectItemAtIndex:indexPath.row];
  }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  if (self.itemType == YPSegementControlItemTypeDefault){
    YPSegementCollectionViewLabelCell *labelCell = (YPSegementCollectionViewLabelCell*)[collectionView cellForItemAtIndexPath:indexPath];
    labelCell.selected = YES;
  }
  if ([self.delegate respondsToSelector:@selector(segementControl:didSelectItemAtIndex:)]) {
    [self.delegate segementControl:self didSelectItemAtIndex:indexPath.row];
  }
  self.selectedIndex = indexPath.row;
  [self setIndicatorViewFrame];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
  if ([self.delegate respondsToSelector:@selector(segementControl:willDisplayView:atIndex:)]) {
    YPSegementCollectionViewCell *segementCollectionViewCell = (YPSegementCollectionViewCell *)cell;
    [self.delegate segementControl:self willDisplayView:segementCollectionViewCell.customView atIndex:indexPath.row];
  }
}


@end
