//
//  NSObject+KL_AssociatedObject.m
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSObject+KL_AssociatedObject.h"
#import <objc/runtime.h>

@implementation NSObject (KL_AssociatedObject)

- (void)kl_setAssociateValue:(id)value withKey:(void *)key {
  objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)kl_setAssociateWeakValue:(id)value withKey:(void *)key {
  objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)kl_setAssociateCopyValue:(id)value withKey:(void *)key {
  objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)kl_associatedValueForKey:(void *)key {
  return objc_getAssociatedObject(self, key);
}

@end
