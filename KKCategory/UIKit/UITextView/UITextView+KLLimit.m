//
//  UITextView+KLLimit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/30/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UITextView+KLLimit.h"
#import <objc/runtime.h>

@interface KL_PrivateUITextViewMaxLengthHelper : NSObject

@property (nonatomic, assign) NSUInteger maxLength;
@property (nonatomic, weak)   UITextView *textView;

- (instancetype)initWithTextView:(UITextView *)textView maxLength:(NSUInteger)maxLength;

@end

@interface UITextView (KL_PrivateMaxLengthHelper)
@property (nonatomic, strong) KL_PrivateUITextViewMaxLengthHelper *kl_maxLengthHelper;
@end


@implementation UITextView (KLLimit)

static void *klUITextViewLimitMaxLengthKey = &klUITextViewLimitMaxLengthKey;

- (void)setKl_maxLength:(NSUInteger)kl_maxLength {
  objc_setAssociatedObject(self, klUITextViewLimitMaxLengthKey, @(kl_maxLength), OBJC_ASSOCIATION_COPY);
  self.kl_maxLengthHelper.maxLength = kl_maxLength;
}

- (NSUInteger)kl_maxLength {
  return [objc_getAssociatedObject(self, klUITextViewLimitMaxLengthKey) unsignedIntegerValue];
}

@end

@implementation UITextView (kl_PrivateMaxLengthHelper)

static void *klkl_maxLengthHelper = &klkl_maxLengthHelper;
- (void)setkl_maxLengthHelper:(KL_PrivateUITextViewMaxLengthHelper *)kl_maxLengthHelper {
  objc_setAssociatedObject(self, klkl_maxLengthHelper, kl_maxLengthHelper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (KL_PrivateUITextViewMaxLengthHelper *)kl_maxLengthHelper {
  KL_PrivateUITextViewMaxLengthHelper *helper = objc_getAssociatedObject(self, klkl_maxLengthHelper);
  if (!helper) {
    helper = [[KL_PrivateUITextViewMaxLengthHelper alloc] initWithTextView:self maxLength:self.kl_maxLength];
    [self setkl_maxLengthHelper:helper];
  }
  
  return helper;
}

@end

@implementation KL_PrivateUITextViewMaxLengthHelper

- (instancetype)initWithTextView:(UITextView *)textView maxLength:(NSUInteger)maxLength {
  if (self = [super init]) {
    _textView = textView;
    _maxLength = maxLength;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_kl_valueChanged:) name:UITextViewTextDidBeginEditingNotification object:textView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_kl_valueChanged:) name:UITextViewTextDidChangeNotification object:textView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_kl_valueChanged:) name:UITextViewTextDidEndEditingNotification object:textView];
  }
  return self;
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - private
- (void)_kl_valueChanged:(NSNotification *)notification {
  UITextView *textView = [notification object];
  if (textView != self.textView) {
    return;
  }
  
  if (self.maxLength == 0) {
    return;
  }
  
  NSUInteger currentLength = [textView.text length];
  if (currentLength <= self.maxLength) {
    return;
  }
  
  NSString *subString = [textView.text substringToIndex:self.maxLength];
  dispatch_async(dispatch_get_main_queue(), ^{
    self.textView.text = subString;
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:self.textView];
  });
}

@end