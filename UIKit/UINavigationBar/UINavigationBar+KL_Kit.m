//
//  UINavigationBar+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/29/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UINavigationBar+KL_Kit.h"

@implementation UINavigationBar (KL_Kit)

- (UIImageView *)kl_underHarilineImageView {
  return [self.class kl_findHairlineImageViewUnder:self];
}

+ (UIImageView *)kl_findHairlineImageViewUnder:(UIView *)view {
  if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
    return (UIImageView *)view;
  }
  
  for (UIView *subview in view.subviews) {
    UIImageView *imageView = [self kl_findHairlineImageViewUnder:subview];
    if (imageView) {
      return imageView;
    }
  }
  
  return nil;
}

@end
