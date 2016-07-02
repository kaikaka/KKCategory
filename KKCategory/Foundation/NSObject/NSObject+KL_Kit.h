//
//  NSObject+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CodingSupport.h"
#import "NSObject+Reflex.h"
#import "NSObject+KL_associatedObject.h"

@interface NSObject (KL_Kit)

/**
 *  @brief  Returns the size of instances of a self.
 *
 *  @return The size in bytes of instances of the class cls
 */
+ (NSUInteger)kl_sizeInstance;

/**
 *  @brief  Returns the size of self.
 *
 *  @return The size in bytes of self;
 */
- (NSUInteger)kl_sizeInstance;

@end
