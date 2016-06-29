//
//  NSString+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/29/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSString+KL_Kit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (KL_Kit)

+ (BOOL)kl_isEqualString:(NSString *)string toOtherString:(NSString *)otherString {
  if (string == otherString) {
    return YES;
  }
  
  return [string isEqualToString:otherString];
}

- (NSString *)kl_MD5 {
  const char *cStr = [self UTF8String];
  unsigned char result[32];
  CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
  
  return [NSString stringWithFormat:
          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
          result[0],result[1],result[2],result[3],
          result[4],result[5],result[6],result[7],
          result[8],result[9],result[10],result[11],
          result[12],result[13],result[14],result[15]];
}

- (BOOL)kl_isVaildPhoneNumber {
  NSString *phoneRegex = @"^1\\d{10}$";
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
  return [predicate evaluateWithObject:self];
}

- (BOOL)kl_isVaildQQ {
  NSString *qqRegex = @"^[1-9]\\d{4,9}$";
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", qqRegex];
  return [predicate evaluateWithObject:self];
}

- (BOOL)kl_isContainString:(NSString *)subString {
  return [self rangeOfString:subString].location != NSNotFound;
}

- (BOOL)kl_lessThanVersion:(NSString *)newVersion {
  return [self compare:newVersion options:NSNumericSearch] == NSOrderedAscending;
}

- (BOOL)kl_isEmpty {
  return self.length == 0;
}

@end

@implementation NSString (kl_Size)

- (CGSize)kl_sizeWithFont:(UIFont *)font {
  if ([self length] == 0) return CGSizeZero;
  
  return [self sizeWithAttributes:@{NSFontAttributeName: font}];
}

- (CGSize)kl_sizeWithLimitSize:(CGSize)size font:(UIFont *)font {
  return [self kl_sizeWithLimitSize:size attributes:@{NSFontAttributeName: font}];
}

- (CGFloat)kl_heightWithWidth:(CGFloat)width font:(UIFont *)font {
  return [self kl_sizeWithLimitSize:CGSizeMake(width, MAXFLOAT) font:font].height;
}

- (CGSize)kl_sizeWithLimitSize:(CGSize)size attributes:(NSDictionary *)attributes {
  if ([self length] == 0) return CGSizeZero;
  
  return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

@end

@implementation NSString (kl_extension)

- (BOOL)kl_isGifExtension {
  NSString *extension = [self pathExtension];
  BOOL isPicGif = [extension caseInsensitiveCompare:@"gif"] == NSOrderedSame;
  
  return isPicGif;
}
- (BOOL)kl_isMP4Extension {
  NSString *extension = [self pathExtension];
  BOOL isMP4 = [extension caseInsensitiveCompare:@"mp4"] == NSOrderedSame;
  
  return isMP4;
}

- (BOOL)kl_isMovExtension {
  NSString *extension = [self pathExtension];
  BOOL isMov = [extension caseInsensitiveCompare:@"mov"] == NSOrderedSame;
  
  return isMov;
}

@end
