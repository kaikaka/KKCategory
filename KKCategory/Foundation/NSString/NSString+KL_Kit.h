//
//  NSString+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 6/29/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (KL_Kit)

/**
 *  @brief  判断两个字符串是否相等
 *          注意：如果两个字串都为nil，也返回YES
 */
+ (BOOL)kl_isEqualString:(NSString *)string toOtherString:(NSString *)otherString;

/**
 *  @brief  转换成MD5字符串
 *
 *  @return MD5字符串
 */
- (NSString *)kl_MD5;

/**
 *  @brief  是否是合法的手机号码
 *
 *  @return 如果是合法的手机号码则返回YES；否则返回NO
 */
- (BOOL)kl_isVaildPhoneNumber;

/**
 *  @brief  是否有子串
 *
 *  @param subString 要判断的字符串
 *
 *  @return 如果有包含子串，则返回YES   否则返回NO
 */
- (BOOL)kl_isContainString:(NSString *)subString;

/**
 *  @brief  判断是否是合法的QQ号码
 *
 *  @return 如果是合法的QQ号码，则返回YES；否则返回NO
 */
- (BOOL)kl_isVaildQQ;

/**
 *  @brief  当前字符串（应该是版本号）是否小于newVersion。
 *          如“1.1.0211” 则小于 "1.2.0210"
 *  @param newVersion 新的版本号  如“1.2.0210”
 *
 *  @return 如果小于newVersion，返回YES；否则返回NO
 */
- (BOOL)kl_lessThanVersion:(NSString *)newVersion;

- (BOOL)kl_isEmpty;

@end

#pragma mark - category(kl_Size)
/**
 *  @brief  主要用于计算字符串在屏幕上的大小
 */
@interface NSString (kl_Size)

/**
 *  @brief  获取要显示该文本的所需要的size
 *
 *  @param font 字体
 *
 *  @return 要显示文本所需size
 */
- (CGSize)kl_sizeWithFont:(UIFont *)font;

/**
 *  @brief 获取要显示该文本的所需要的size
 *
 *  @param size 限定大小，即返回的size不会超过这个所限定的大小
 *  @param font 字体
 *
 *  @return 要显示文本所需size
 */
- (CGSize)kl_sizeWithLimitSize:(CGSize)size font:(UIFont *)font;

/**
 *  @brief  获取要显示文本的所需的高度
 *
 *  @param width 限定的宽度
 *  @param font  字体
 *
 *  @return 文本所需高度
 */
- (CGFloat)kl_heightWithWidth:(CGFloat)width font:(UIFont *)font;

- (CGSize)kl_sizeWithLimitSize:(CGSize)size attributes:(NSDictionary *)attributes;

@end

@interface NSString (kl_extension)

- (BOOL)kl_isGifExtension;
- (BOOL)kl_isMP4Extension;
- (BOOL)kl_isMovExtension;

@end
