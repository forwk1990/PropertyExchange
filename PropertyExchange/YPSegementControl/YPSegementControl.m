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

@property (nonatomic, strong) UICollectionView *containerView;
@property (nonatomic, strong) YPSegementCollectionViewLayout *containerViewLayout;
@property (nonatomic, assign) CGFloat totalContentWidth;

@end

@implementation YPSegementControl

- (instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    [self addSubview:self.containerView];
    [self initialize];
  }
  return self;
}

- (void)initialize{
  
  self.textColor = [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0];
  self.selectedTextColor = [UIColor blackColor];
  self.fontSize = 14;
  self.selectedFontSize = 14;
  
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

- (void)setDelegate:(id<YPSegementControlDelegate>)delegate{
  _delegate = delegate;
  
  // set total content width for calculate collectionview contentsize
  NSUInteger numberOfItems = [self.delegate numberOfItemsIn:self];
  CGSize sizeOfItem = [self.delegate sizeOfItemIn:self];
  self.totalContentWidth = numberOfItems * sizeOfItem.width;
  
  // set containerview layout item size
  self.containerViewLayout.itemSize = sizeOfItem;
  
}

- (void)layoutSubviews{
  [super layoutSubviews];
  
  CGFloat width = self.frame.size.width;
  CGFloat height = self.frame.size.height;
  
  self.containerView.frame = CGRectMake(self.containerInsets.left, self.containerInsets.top, width - (self.containerInsets.left + self.containerInsets.right), height - (self.containerInsets.top + self.containerInsets.bottom));
  self.containerView.contentSize = CGSizeMake(self.totalContentWidth, self.containerView.frame.size.height);
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
    cell = labelCell;
  }else if(self.itemType == YPSegementControlItemTypeCollectionViewCell){
    
  }else{
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:[YPSegementCollectionViewCell className] forIndexPath:indexPath];
    cell.customView = [self.delegate segementControl:self viewForItemAtIndex:indexPath.row];
  }
  CGSize sizeOfItem = [self.delegate sizeOfItemIn:self];
  cell.customView.frame = CGRectMake(0, 0, sizeOfItem.width, sizeOfItem.height);
  return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
  if (![kind isEqualToString:YPSegementCollectionElementKindSeparator]) return nil;
  
  UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:YPSegementCollectionElementKindSeparator withReuseIdentifier:YPSegementCollectionElementKindSeparator forIndexPath:indexPath];
  reusableView.backgroundColor = self.separatorColor;
  return reusableView;
}

#pragma mark UICollection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  if ([self.delegate respondsToSelector:@selector(segementControl:didSelectItemAtIndex:)]) {
    [self.delegate segementControl:self didSelectItemAtIndex:indexPath.row];
  }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
  if ([self.delegate respondsToSelector:@selector(segementControl:willDisplayView:atIndex:)]) {
    YPSegementCollectionViewCell *segementCollectionViewCell = (YPSegementCollectionViewCell *)cell;
    [self.delegate segementControl:self willDisplayView:segementCollectionViewCell.customView atIndex:indexPath.row];
  }
}

@end
