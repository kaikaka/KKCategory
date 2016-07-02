//
//  NSArray+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSArray+KL_Functional.h"
#import "NSMutableArray+KL_Kit.h"

@interface NSArray (KL_Kit)

- (id)kl_safetyObjectAtIndex:(NSUInteger)index;
- (instancetype)kl_arrayByAddUniqueArray:(NSArray *)array;
- (BOOL)kl_isEmpty;

/**
 *  @brief  Returns the size of all instances of the array.
 *
 *  @return The size in bytes of all instances of the array.
 */
- (NSUInteger)kl_sizeAllObjects;

@end
