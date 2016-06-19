//
//  UITextField+Kl_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UITextField+Kl_Kit.h"
#import <objc/runtime.h>

@implementation UITextField (Kl_Kit)

@end

@interface klUITextFieldKitService : NSObject <UITextFieldDelegate>

@property (nonatomic, weak) UIResponder *lastFirstResponder;
@property (nonatomic, weak) UIResponder *nextFirstResponder;
@property (nonatomic, copy) void (^returnKeyBlock)(void);

@end

@implementation klUITextFieldKitService

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  BOOL result = YES;
  
  if (self.nextFirstResponder && [self.nextFirstResponder canBecomeFirstResponder]) {
    [self.nextFirstResponder becomeFirstResponder];
    result = NO;
  }
  
  if (self.returnKeyBlock) {
    self.returnKeyBlock();
    return NO;
  }
  
  if (result == YES && [textField canResignFirstResponder]) {
    [textField resignFirstResponder];
    return NO;
  }
  
  return result;
}

@end

@implementation UITextField (kl_textFieldDelegate)

- (void)kl_returnKeyBlock:(void (^)(void))returnKeyBlock {
  [self setupKitService];
  
  klUITextFieldKitService *service = [self kl_kitService];
  service.returnKeyBlock = returnKeyBlock;
}

- (void)setKl_nextFirstResponder:(id)kl_nextFirstResponder {
  if (kl_nextFirstResponder) {
    self.returnKeyType = UIReturnKeyNext;
  } else {
    self.returnKeyType = UIReturnKeyDone;
  }
  
  [self setupKitService];
  
  klUITextFieldKitService *service = [self kl_kitService];
  [service setNextFirstResponder:kl_nextFirstResponder];
  
  if ([kl_nextFirstResponder respondsToSelector:@selector(kl_lastFirstResponder)]
      && !([kl_nextFirstResponder performSelector:@selector(kl_lastFirstResponder)])) {
    if ([kl_nextFirstResponder respondsToSelector:@selector(setKl_lastFirstResponder:)]) {
      [kl_nextFirstResponder performSelector:@selector(setKl_lastFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)kl_nextFirstResponder {
  return [[self kl_kitService] nextFirstResponder];
}

- (void)setupKitService {
  klUITextFieldKitService *service = [self kl_kitService];
  if (!service) {
    service = [[klUITextFieldKitService alloc] init];
    [self setKl_kitService:service];
  }
  
  self.delegate = service;
}

static void *kl_returnKeyServiceKey = &kl_returnKeyServiceKey;
- (void)setKl_kitService:(klUITextFieldKitService *)service {
  objc_setAssociatedObject(self, kl_returnKeyServiceKey, service, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (klUITextFieldKitService *)kl_kitService {
  return objc_getAssociatedObject(self, kl_returnKeyServiceKey);
}

@end

@implementation UITextField (kl_inputAccessoryView)

- (void)setKl_lastFirstResponder:(UIResponder *)kl_lastFirstResponder {
  id delegate = self.delegate;
  [self setupKitService];
  if (delegate) {
    self.delegate = delegate;
  }
  
  klUITextFieldKitService *service = [self kl_kitService];
  service.lastFirstResponder = kl_lastFirstResponder;
  
  if ([kl_lastFirstResponder respondsToSelector:@selector(kl_nextFirstResponder)]
      && !([kl_lastFirstResponder performSelector:@selector(kl_nextFirstResponder)])) {
    if ([kl_lastFirstResponder respondsToSelector:@selector(setKl_nextFirstResponder:)]) {
      [kl_lastFirstResponder performSelector:@selector(setKl_nextFirstResponder:) withObject:self];
    }
  }
}

- (UIResponder *)kl_lastFirstResponder {
  return [self kl_kitService].lastFirstResponder;
}

static void *kl_showInputAccessoryViewKey = &kl_showInputAccessoryViewKey;
- (void)setKl_showInputAccessoryView:(BOOL)kl_showInputAccessoryView {
  objc_setAssociatedObject(self, kl_showInputAccessoryViewKey, @(kl_showInputAccessoryView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if (kl_showInputAccessoryView) {
    self.inputAccessoryView = [[KLInputAccessoryView alloc] initWithTargert:self last:self.kl_lastFirstResponder next:self.kl_nextFirstResponder doneBlock:nil];
  } else {
    self.inputAccessoryView = nil;
  }
}

- (BOOL)kl_showInputAccessoryView {
  return [objc_getAssociatedObject(self, kl_showInputAccessoryViewKey) boolValue];
}

@end