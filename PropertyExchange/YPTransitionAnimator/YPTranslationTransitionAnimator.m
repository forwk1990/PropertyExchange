//
//  YPTranslationTransitionAnimator.m
//  PropertyExchange
//
//  Created by itachi on 16/10/8.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "YPTranslationTransitionAnimator.h"

@interface YPTranslationTransitionAnimator ()

@property (nonatomic,assign) YPTranslationTransitionAnimatorOrientation orientation;

@end

@implementation YPTranslationTransitionAnimator

- (instancetype)initWithOrientation:(YPTranslationTransitionAnimatorOrientation)orientation{
  if (self = [super init]) {
    self.orientation = orientation;
  }
  return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;{
  return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
  UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
  UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
}

@end
