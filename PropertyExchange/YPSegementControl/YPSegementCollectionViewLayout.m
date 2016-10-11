//
//  YPSegementCollectionViewLayout.m
//  PropertyExchange
//
//  Created by itachi on 16/10/11.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPSegementCollectionViewLayout.h"

@interface YPSegementCollectionViewLayout ()

@property (nonatomic,copy) NSDictionary<NSIndexPath*,UICollectionViewLayoutAttributes*> *layoutAttributesCacheForSupplementaryView;

@end

@implementation YPSegementCollectionViewLayout

- (void)prepareLayout{
  [super prepareLayout];
  
  NSMutableDictionary *layoutAttributesForSupplementaryView = [NSMutableDictionary dictionary];
  
  NSUInteger numberOfSections = [self.collectionView numberOfSections];
  for (NSUInteger sectionIndex = 0; sectionIndex < numberOfSections; sectionIndex++) {
    NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:sectionIndex];
    for (NSUInteger itemIndex = 0; itemIndex < numberOfItems; itemIndex++) {
      NSIndexPath *indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:sectionIndex];
      UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForSupplementaryViewOfKind:YPSegementCollectionElementKindSeparator atIndexPath:indexPath];
      [layoutAttributesForSupplementaryView setObject:layoutAttributes forKey:indexPath];
    }
  }
  
  self.layoutAttributesCacheForSupplementaryView = layoutAttributesForSupplementaryView;
  
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
  NSMutableArray *mutableLayoutAttributes = [NSMutableArray arrayWithArray:[super layoutAttributesForElementsInRect:rect]];
  [self.layoutAttributesCacheForSupplementaryView enumerateKeysAndObjectsUsingBlock:^(NSIndexPath * _Nonnull key, UICollectionViewLayoutAttributes * _Nonnull obj, BOOL * _Nonnull stop) {
    [mutableLayoutAttributes addObject:obj];
  }];
  return mutableLayoutAttributes;
}



- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
  
  // if element kind is the default kind, use default logic
  if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]
      || [elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
    return [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
  }
  
  // only for YPSegementCollectionElementKindSeparator
  if (![elementKind isEqualToString:YPSegementCollectionElementKindSeparator]) {
    return nil;
  }
  
  UICollectionViewLayoutAttributes *layoutAttributesForSupplementaryView = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
  NSUInteger numberOfItemsInSection = [self.collectionView numberOfItemsInSection:indexPath.section];
  
  // if the index path is the last one, supplementary should be hidden
  // else place the supplementary view at the right of the cell
  if (numberOfItemsInSection == indexPath.row + 1) {
    layoutAttributesForSupplementaryView.hidden = YES;
  }else{
    UICollectionViewLayoutAttributes *layoutAttributesForCell = [self.collectionView layoutAttributesForItemAtIndexPath:indexPath];
    CGFloat maxOriginX = CGRectGetMaxX(layoutAttributesForCell.frame);
    CGFloat centerY = layoutAttributesForCell.center.y;
    CGFloat height = layoutAttributesForCell.size.height;
    layoutAttributesForSupplementaryView.center = CGPointMake(maxOriginX, centerY);
    layoutAttributesForSupplementaryView.size = CGSizeMake(self.separatorWidth, height - (self.separatorInsets.top + self.separatorInsets.bottom));
  }
  return layoutAttributesForSupplementaryView;
}

@end
