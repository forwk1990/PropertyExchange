//
//  YPTranslationTransitionAnimator.h
//  PropertyExchange
//
//  Created by itachi on 16/10/8.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YPTranslationTransitionAnimatorOrientation) {
  YPTranslationTransitionAnimatorOrientationUpToDown = 0,
  YPTranslationTransitionAnimatorOrientationDownToUP = 1,
  YPTranslationTransitionAnimatorOrientationLeftToRight = 2,
  YPTranslationTransitionAnimatorOrientationRightToLeft = 3
};


@interface YPTranslationTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithOrientation:(YPTranslationTransitionAnimatorOrientation)orientation;

@end
