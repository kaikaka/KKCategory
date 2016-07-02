//
//  UITextView+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/30/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UITextView+KL_Kit.h"
#import <objc/runtime.h>
#import "KLInputAccessoryView.h"

@implementation UITextView (KL_Kit)

@end
@implementation UITextView (KL_inputAccessoryView)

- (void)setKl_nextFirstResponder:(UIResponder *)kl_nextFirstResponder {
  objc_setAssociatedObject(self, sel_getName(@selector(kl_nextFirstResponder)), kl_nextFirstResponder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if ([kl_nextFirstResponder respondsToSelector:@selector(kl_lastFirstResponder)]
      && ![kl_nextFirstResponder performSelector:@selector(kl_lastFirstResponder)]) {
    if ([kl_nextFirstResponder respondsToSelector:@selector(setKl_lastFirstResponder:)]) {
      [kl_nextFirstResponder performSelector:@selector(setKl_lastFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)kl_nextFirstResponder {
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setKl_lastFirstResponder:(UIResponder *)kl_lastFirstResponder {
  objc_setAssociatedObject(self, sel_getName(@selector(kl_lastFirstResponder)), kl_lastFirstResponder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if ([kl_lastFirstResponder respondsToSelector:@selector(kl_nextFirstResponder)]
      && ![kl_lastFirstResponder performSelector:@selector(kl_nextFirstResponder)]) {
    if ([kl_lastFirstResponder respondsToSelector:@selector(setKl_nextFirstResponder:)]) {
      [kl_lastFirstResponder performSelector:@selector(setKl_nextFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)kl_lastFirstResponder {
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setKl_showInputAccessoryView:(BOOL)kl_showInputAccessoryView {
  objc_setAssociatedObject(self, @selector(kl_showInputAccessoryView), @(kl_showInputAccessoryView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if (kl_showInputAccessoryView) {
    self.inputAccessoryView = [[KLInputAccessoryView alloc] initWithTargert:self last:self.kl_lastFirstResponder next:self.kl_nextFirstResponder doneBlock:nil];
  } else {
    self.inputAccessoryView = nil;
  }
}

- (BOOL)kl_showInputAccessoryView {
  return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end