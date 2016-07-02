//
//  NSObject+KL_AssociatedObject.h
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KL_AssociatedObject)

- (void)kl_setAssociateValue:(id)value withKey:(void *)key; // Strong reference
- (void)kl_setAssociateWeakValue:(id)value withKey:(void *)key;
- (void)kl_setAssociateCopyValue:(id)value withKey:(void *)key;
- (id)kl_associatedValueForKey:(void *)key;

@end
