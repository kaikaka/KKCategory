//
//  NSDictionary+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSDictionary+KL_Short.h"
#import "NSMutableDictionary+KL_Short.h"

@interface NSDictionary (KL_Kit)

- (BOOL)kl_hasKey:(NSString *)key;

/**
 *  @brief  Returns a Boolean value that indicates whether a given object is present in the dictionary as a value.
 *       This method determines whether anObject is present in the values array by sending an isEqual: message to each
 *       of the array’s objects (and passing anObject as the parameter to each isEqual: message).
 *
 *  @param value An object
 *
 *  @return YES if anObject is present in the dictionary as a value, otherwise NO.
 */
- (BOOL)kl_containsValue:(NSString *)value;

/**
 *  @brief  Returns the size of all instances of the dictionary keys.
 *
 *  @return The size in bytes of all instances of the dictionary keys.
 */
- (NSUInteger)kl_sizeAllKeys;

/**
 *  @brief  Returns the size of all instances of the dictionary values.
 *
 *  @return The size in bytes of all instances of the dictionary values.
 */
- (NSUInteger)kl_sizeAllValues;

/**
 *  @brief  Returns the size of all instances of the dictionary keys and values.
 *       eq: [self kl_sizeAllKeys] + [self kl_sizeAllValues]
 *
 *  @return The size in bytes of all instances of the dictionary keys and values.
 */
- (NSUInteger)kl_sizeAllObjects;

@end

@interface NSMutableDictionary (kl_SafeAccessory)

- (BOOL)kl_setObject:(id)object forKey:(id)key;

@end
