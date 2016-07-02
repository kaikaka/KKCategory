//
//  NSArray+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSArray+KL_Kit.h"
#import "NSObject+KL_Kit.h"

@implementation NSArray (KL_Kit)

- (id)kl_safetyObjectAtIndex:(NSUInteger)index {
  if (index < [self count]) {
    return [self objectAtIndex:index];
  }
  
  return nil;
}

- (instancetype)kl_arrayByAddUniqueArray:(NSArray *)array {
  NSMutableArray *result = [NSMutableArray arrayWithArray:self];
  for (id obj in array) {
    if ([result containsObject:obj]) continue;
    [result addObject:obj];
  }
  
  return result;
}

- (BOOL)kl_isEmpty {
  return [self count] == 0;
}

- (NSUInteger)kl_sizeAllObjects {
  __block NSUInteger size = 0;
  
  for (NSUInteger index = 0; index < [self count]; ++index) {
    id obj = self[index];
    size += [obj kl_sizeInstance];
  }
  
  return size;
}

@end
