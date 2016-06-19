//
//  UIButton+KLKit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UIButton+KLKit.h"

@implementation UIButton (KLKit)

- (void)setKl_image:(UIImage *)kl_image {
  /**
   *  @brief  In ios7.1 UiButton set image not working?
   *          see:http://stackoverflow.com/questions/22471182/in-ios7-1-uibutton-set-image-not-working
   */
  BOOL shouldEnable = self.enabled;
  self.enabled = YES;
  [self setImage:kl_image forState:UIControlStateNormal];
  self.enabled = shouldEnable;
}

- (void)setKl_imageHighlighted:(UIImage *)kl_imageHighlighted {
  [self setImage:kl_imageHighlighted forState:UIControlStateHighlighted];
}

- (UIImage *)kl_imageHighlighted {
  return [self imageForState:UIControlStateHighlighted];
}

- (void)setKl_title:(NSString *)kl_title {
  BOOL shouldEnable = self.enabled;
  self.enabled = YES;
  [self setTitle:kl_title forState:UIControlStateNormal];
  self.enabled = shouldEnable;
  
}

- (void)setKl_titleHighlighted:(NSString *)kl_titleHighlighted {
  [self setTitle:kl_titleHighlighted forState:UIControlStateHighlighted];
}

- (NSString *)kl_titleHighlighted {
  return [self titleForState:UIControlStateHighlighted];
}

- (UIImage *)kl_image {
  return [self imageForState:UIControlStateNormal];
}

- (NSString *)kl_title {
  return [self titleForState:UIControlStateNormal];
}

- (UIImage *)kl_backgroundImage {
  return [self backgroundImageForState:UIControlStateNormal];
}

- (void)setKl_backgroundImage:(UIImage *)kl_backgroundImage {
  [self willChangeValueForKey:@"kl_backgroundImage"];
  [self setBackgroundImage:kl_backgroundImage forState:UIControlStateNormal];
  [self didChangeValueForKey:@"kl_backgroundImage"];
}

- (UIImage *)kl_backgroundImageHighlighted {
  return [self backgroundImageForState:UIControlStateHighlighted];
}

- (void)setKl_backgroundImageHighlighted:(UIImage *)kl_backgroundImageHighlighted {
  [self setBackgroundImage:kl_backgroundImageHighlighted forState:UIControlStateHighlighted];
}

@end

@implementation UIButton (kl_VerticalLayout)

- (void)kl_centerVerticallyWithPadding:(float)padding {
  CGSize imageSize = self.imageView.frame.size;
  CGSize titleSize = self.titleLabel.frame.size;
  
  CGFloat totalHeight = (imageSize.height + titleSize.height + padding);
  CGFloat imageWidth = MIN(imageSize.width, CGRectGetWidth(self.bounds));
  CGFloat titleWidth = MIN(titleSize.width, CGRectGetWidth(self.bounds));
  
  
  self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height),
                                          0.0f,
                                          0.0f,
                                          - titleWidth);
  
  self.titleEdgeInsets = UIEdgeInsetsMake(0.0f,
                                          - imageWidth,
                                          - (totalHeight - titleSize.height),
                                          0.0f);
  
}


- (void)kl_centerVertically {
  const CGFloat kDefaultPadding = 6.0f;
  
  [self kl_centerVerticallyWithPadding:kDefaultPadding];
}


@end
