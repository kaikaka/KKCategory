//
//  NSDictionary+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSDictionary+KL_Kit.h"
#import "NSArray+KL_Kit.h"

@implementation NSDictionary (KL_Kit)

- (BOOL)kl_hasKey:(NSString *)key {
  return [self objectForKey:key] != nil;
}

- (BOOL)kl_containsValue:(NSString *)value {
  return [[self allValues] containsObject:value];
}

/**
 *  @brief  Returns the size of all instances of the dictionary keys.
 *
 *  @return The size in bytes of all instances of the dictionary keys.
 */
- (NSUInteger)kl_sizeAllKeys {
  return [[self allKeys] kl_sizeAllObjects];
}

/**
 *  @brief  Returns the size of all instances of the dictionary values.
 *
 *  @return The size in bytes of all instances of the dictionary values.
 */
- (NSUInteger)kl_sizeAllValues {
  return [[self allValues] kl_sizeAllObjects];
}

/**
 *  @brief  Returns the size of all instances of the dictionary keys and values.
 *       eq: [self kl_sizeAllKeys] + [self kl_sizeAllValues]
 *
 *  @return The size in bytes of all instances of the dictionary keys and values.
 */
- (NSUInteger)kl_sizeAllObjects {
  return [self kl_sizeAllKeys] + [self kl_sizeAllValues];
}

@end

@implementation NSMutableDictionary (kl_SafeAccessory)

- (BOOL)kl_setObject:(id)object forKey:(id)key {
  if (!object) return NO;
  
  [self setObject:object forKey:key];
  
  return YES;
}

@end