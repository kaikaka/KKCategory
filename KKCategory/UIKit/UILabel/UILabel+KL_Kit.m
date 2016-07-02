//
//  UILabel+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/29/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UILabel+KL_Kit.h"
#import "NSString+kl_Kit.h"

@implementation UILabel (KL_Kit)

@end

@implementation UILabel (kl_Size)

/**
 *  @brief  获取文本在本label中显示所需size
 *
 *  @param text 文本
 *
 *  @return 文本显示所需size
 */
- (CGSize)kl_sizeWithText:(NSString *)text {
  return [text kl_sizeWithFont:self.font];
}

/**
 *  @brief  获取本label中的文本显示所需size
 *
 *  @return 本label中的文本显示所需size
 */
- (CGSize)kl_sizeForOwnerText {
  return [self.text kl_sizeWithFont:self.font];
}

/**
 *  @brief 获取text在本label中显示时，在最大宽度为maxWidth时，所需高度
 *
 *  @param maxWidth 最大宽度
 *  @param text     文本
 *
 *  @return 文本显示所需高度
 */
- (CGFloat)kl_heightWithMaxWidth:(CGFloat)maxWidth text:(NSString *)text {
  return [text kl_heightWithWidth:maxWidth font:self.font];
}

/**
 *  @brief 获取在最大宽度为maxWidth时，本label中的文本显示所需高度
 *
 *  @param maxWidth 最大宽度
 *
 *  @return 本label中文本显示所需高度
 */
- (CGFloat)kl_heightWithMaxWidth:(CGFloat)maxWidth {
  return [self.text kl_heightWithWidth:maxWidth font:self.font];
}

@end