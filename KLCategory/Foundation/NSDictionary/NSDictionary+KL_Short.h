//
//  NSDictionary+KL_Short.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (KL_Short)

- (long)kl_longForKey:(NSString *)key;
- (int)kl_intForKey:(NSString *)key;

- (NSString*)kl_stringForKey:(id)key;

- (NSNumber*)kl_numberForKey:(id)key;

- (NSArray*)kl_arrayForKey:(id)key;

- (NSDictionary*)kl_dictionaryForKey:(id)key;

- (NSInteger)kl_integerForKey:(id)key;

- (NSUInteger)kl_unsignedIntegerForKey:(id)key;

- (BOOL)kl_boolForKey:(id)key;

- (int16_t)kl_int16ForKey:(id)key;

- (int32_t)kl_int32ForKey:(id)key;

- (int64_t)kl_int64ForKey:(id)key;

- (char)kl_charForKey:(id)key;

- (short)kl_shortForKey:(id)key;

- (float)kl_floatForKey:(id)key;

- (double)kl_doubleForKey:(id)key;

- (long long)kl_longLongForKey:(id)key;

- (unsigned long long)kl_unsignedLongLongForKey:(id)key;

//CG
- (CGFloat)kl_CGFloatForKey:(id)key;

- (CGPoint)kl_pointForKey:(id)key;

- (CGSize)kl_sizeForKey:(id)key;

- (CGRect)kl_rectForKey:(id)key;

@end
