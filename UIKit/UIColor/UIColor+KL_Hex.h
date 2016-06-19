//
//  UIColor+KL_Hex.h
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KL_Hex)

+ (UIColor *)kl_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

+ (UIColor *)kl_colorWithHex:(UInt32)hex;
+ (UIColor *)kl_colorWithHexString:(id)input;

- (UInt32)kl_hexValue;

@end
