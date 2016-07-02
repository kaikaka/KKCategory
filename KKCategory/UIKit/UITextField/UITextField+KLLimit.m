//
//  UITextField+KLLimit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UITextField+KLLimit.h"
#import <objc/runtime.h>

@implementation UITextField (KLLimit)

static void *klLimitMaxLengthKey = &klLimitMaxLengthKey;

- (void)setKl_maxLength:(NSUInteger)kl_maxLength {
  objc_setAssociatedObject(self, klLimitMaxLengthKey, @(kl_maxLength), OBJC_ASSOCIATION_COPY);
  
  if (kl_maxLength > 0) {
    [self addTarget:self action:@selector(_kl_valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
  } else {
    [self removeTarget:self action:@selector(_kl_valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
  }
}

- (NSUInteger)kl_maxLength {
  return [objc_getAssociatedObject(self, klLimitMaxLengthKey) unsignedIntegerValue];
}

#pragma mark - private

- (void)_kl_valueChanged:(UITextField *)textField {
  if (self.kl_maxLength == 0) {
    return;
  }
  
  NSUInteger currentLength = [textField.text length];
  if (currentLength <= self.kl_maxLength) {
    return;
  }
  
  NSString *subString = [textField.text substringToIndex:self.kl_maxLength];
  dispatch_async(dispatch_get_main_queue(), ^{
    textField.text = subString;
    [textField sendActionsForControlEvents:UIControlEventEditingChanged];
  });
}

@end
