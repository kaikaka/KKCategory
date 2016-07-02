//
//  NSMutableArray+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (KL_Kit)

- (BOOL)kl_addObject:(id)object;

- (BOOL)kl_addUniqueObject:(id)object;

- (NSUInteger)kl_addUniqueArray:(NSArray *)array;

@end
