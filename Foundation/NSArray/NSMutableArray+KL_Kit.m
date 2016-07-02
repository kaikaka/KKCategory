//
//  NSMutableArray+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSMutableArray+KL_Kit.h"

@implementation NSMutableArray (KL_Kit)

- (NSUInteger)kl_addUniqueArray:(NSArray *)array {
  if (array == nil) {
    return 0;
  }
  
  NSUInteger originCount = [self count];
  [self removeObjectsInArray:array];
  [self addObjectsFromArray:array];
  
  NSUInteger nowCount = [self count];
  
  return nowCount - originCount;
}

- (BOOL)kl_addUniqueObject:(id)object {
  if ([self containsObject:object]) {
    return NO;
  }
  
  return [self kl_addObject:object];
}

- (BOOL)kl_addObject:(id)object {
  if (object) {
    [self addObject:object];
    return YES;
  }
  return NO;
}

@end
