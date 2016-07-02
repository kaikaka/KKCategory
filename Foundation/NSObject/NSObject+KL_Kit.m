//
//  NSObject+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSObject+KL_Kit.h"
#import <objc/runtime.h>

@implementation NSObject (KL_Kit)

+ (NSUInteger)kl_sizeInstance {
  return class_getInstanceSize(self);
}

- (NSUInteger)kl_sizeInstance {
  return [[self class] kl_sizeInstance];
}

@end
