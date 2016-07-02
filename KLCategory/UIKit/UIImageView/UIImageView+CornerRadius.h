//
//  UIImageView+CornerRadius.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CornerRadius)

- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)kl_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

- (void)kl_cornerRadiusRoundingRect;

- (void)kl_attachBorderWidth:(CGFloat)width color:(UIColor *)color;

@end
