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
@property (nonatomic,copy) NSDictionary<NSIndexPath*,UICollectionViewLayoutAttributes*> *layoutAttributesDictionaryCache;
@property (nonatomic,copy) NSArray<UICollectionViewLayoutAttributes *> *layoutAttributesArrayCache;

@end

@implementation YPSegementCollectionViewLayout

- (instancetype)init{
  if (self = [super init]) {
    
  }
  return self;
}

- (void)prepareLayout{
  [super prepareLayout];
  
  // create cell layout attributes cache
  if (self.layoutAttributesDictionaryCache == nil) {
    NSMutableDictionary *layoutAttributesDictionary = [NSMutableDictionary dictionary];
    NSArray<UICollectionViewLayoutAttributes *> *layoutAttributes = [NSMutableArray arrayWithArray:[super layoutAttributesForElementsInRect:CGRectMake(0, 0, self.collectionView.contentSize.width, self.collectionView.contentSize.height)]];
    [layoutAttributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull attributes, NSUInteger idx, BOOL * _Nonnull stop) {
      [layoutAttributesDictionary setObject:attributes forKey:attributes.indexPath];
    }];
    self.layoutAttributesArrayCache = layoutAttributes;
    self.layoutAttributesDictionaryCache = layoutAttributesDictionary;
  }
  
  // create supplementary view layout attributes cache
  if (self.layoutAttributesCacheForSupplementaryView == nil) {
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
    
    // add the supplementary view layout attributes to the cell layout attributes cache
    NSMutableArray *mutableArrayLayoutAttributes = [NSMutableArray arrayWithArray:self.layoutAttributesArrayCache];
    NSMutableDictionary<NSIndexPath*,UICollectionViewLayoutAttributes*> *mutableDictionaryLayoutAttributes = [NSMutableDictionary dictionaryWithDictionary:self.layoutAttributesDictionaryCache];
    [self.layoutAttributesCacheForSupplementaryView enumerateKeysAndObjectsUsingBlock:^(NSIndexPath * _Nonnull key, UICollectionViewLayoutAttributes * _Nonnull obj, BOOL * _Nonnull stop) {
      [mutableArrayLayoutAttributes addObject:obj];
      [mutableDictionaryLayoutAttributes setObject:obj forKey:key];
    }];
    self.layoutAttributesArrayCache = mutableArrayLayoutAttributes;
    self.layoutAttributesDictionaryCache = mutableDictionaryLayoutAttributes;
  }
  
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
  return self.layoutAttributesArrayCache;
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
    UICollectionViewLayoutAttributes *layoutAttributesForCell = self.layoutAttributesDictionaryCache[indexPath];
    CGFloat maxOriginX = CGRectGetMaxX(layoutAttributesForCell.frame);
    CGFloat centerY = layoutAttributesForCell.center.y;
    CGFloat supplementaryHeight =  layoutAttributesForCell.size.height - (self.separatorInsets.top + self.separatorInsets.bottom);
    layoutAttributesForSupplementaryView.center = CGPointMake(maxOriginX, centerY);
    layoutAttributesForSupplementaryView.size = CGSizeMake(self.separatorWidth, supplementaryHeight);
  }
  return layoutAttributesForSupplementaryView;
}

@end
