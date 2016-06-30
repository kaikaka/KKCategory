//
//  UITextView+KL_Placeholder.m
//  KLKit
//
//  Created by XiangKai Yin on 6/30/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UITextView+KL_Placeholder.h"
#import <objc/runtime.h>

static NSString *const kHoomicNotificationDidChangeTextView = @"kHoomicNotificationDidChangeTextView";

@interface KLAutoPreferredMaxLayoutWidthLabel : UILabel

@end

@implementation KLAutoPreferredMaxLayoutWidthLabel

- (void)setBounds:(CGRect)bounds {
  [super setBounds:bounds];
  
  self.preferredMaxLayoutWidth = CGRectGetWidth(bounds);
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.preferredMaxLayoutWidth = MAX((CGRectGetWidth(self.superview.frame) - CGRectGetMinX(self.frame)), 0);
  
  /**
   *  @brief  第一次调用 [super layoutSubviews] 是为了获得 label 的 frame，而第二次调用是为了改变后更新布局。如果省略第二个调用我们可能会会得到一个 NSInternalInconsistencyException 的错误，因为我们改变了更新约束条件的布局操作，但我们并没有再次触发布局。
   */
  [super layoutSubviews];
}

@end

@interface KLTextViewPlaceholderHelper : NSObject

@property (nonatomic, weak) UITextView *textView;
- (instancetype)initWithTextView:(UITextView *)textView;

@end

@interface UITextView (KL_PlaceholderHelper)

@property (nonatomic, strong, readonly) UILabel *kl_lblPlaceholder;
@property (nonatomic, strong, readonly) KLTextViewPlaceholderHelper *nl_placeholderHelper;

@end

#pragma mark - kl_Placeholder

@implementation UITextView (kl_Placeholder)

+ (void)load {
  Method kl_setAttributedText = class_getInstanceMethod(self, @selector(kl_setAttributedText:));
  Method setAttributedText = class_getInstanceMethod(self, @selector(setAttributedText:));
  
  if (setAttributedText && kl_setAttributedText) {
    method_exchangeImplementations(kl_setAttributedText, setAttributedText);
  }
}

- (void)kl_setAttributedText:(NSAttributedString *)attributedText {
  [self kl_setAttributedText:attributedText];
  
  if (self.kl_isDidChangePostNotification) {
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:self];
  } else {
    [[NSNotificationCenter defaultCenter] postNotificationName:kHoomicNotificationDidChangeTextView object:self];
  }
}

- (void)setkl_placeholder:(NSString *)kl_placeholder {
  [self.kl_lblPlaceholder setText:kl_placeholder];
  
  [self setNeedsDisplay];
}

- (NSString *)kl_placeholder {
  return [self.kl_lblPlaceholder text];
}

- (void)setkl_placeholderColor:(UIColor *)kl_placeholderColor {
  [self.kl_lblPlaceholder setTextColor:kl_placeholderColor];
}

- (UIColor *)kl_placeholderColor {
  return [self.kl_lblPlaceholder textColor];
}

- (void)setkl_placeholderFont:(UIFont *)kl_placeholderFont {
  [self.kl_lblPlaceholder setFont:kl_placeholderFont];
}

- (UIFont *)kl_placeholderFont {
  return [self.kl_lblPlaceholder font];
}

- (void)setkl_isDidChangePostNotification:(BOOL)kl_isDidChangePostNotification {
  objc_setAssociatedObject(self, @selector(kl_isDidChangePostNotification), @(kl_isDidChangePostNotification), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)kl_isDidChangePostNotification {
  return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end

#pragma mark - kl_PlaceholderHelper
@implementation UITextView (kl_PlaceholderHelper)

- (UILabel *)kl_lblPlaceholder {
  if (!objc_getAssociatedObject(self, _cmd)) {
    UILabel *lblPlaceholder = [[KLAutoPreferredMaxLayoutWidthLabel alloc] init];
    [lblPlaceholder setTextColor:[UIColor colorWithWhite:0.789 alpha:1.0]];
    [lblPlaceholder setFont:[self font]];
    [lblPlaceholder setNumberOfLines:0];
    
    [self insertSubview:lblPlaceholder atIndex:0];
    
    lblPlaceholder.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintVs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-7.5-[lblPlaceholder]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lblPlaceholder)];
    
    NSArray *constraintHs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-6-[lblPlaceholder]-6-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lblPlaceholder)];
    [self addConstraints:constraintHs];
    [self addConstraints:constraintVs];
    
    objc_setAssociatedObject(self, _cmd, lblPlaceholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if ([self.text length] > 0) {
      [lblPlaceholder setHidden:YES];
    }
    
    [self kl_placeholderHelper];
  }
  return objc_getAssociatedObject(self, _cmd);
}

- (KLTextViewPlaceholderHelper *)kl_placeholderHelper {
  if (!objc_getAssociatedObject(self, _cmd)) {
    KLTextViewPlaceholderHelper *helper = [[KLTextViewPlaceholderHelper alloc] initWithTextView:self];
    objc_setAssociatedObject(self, _cmd, helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  return objc_getAssociatedObject(self, _cmd);
}

@end


#pragma mark - klTextViewPlaceholderHelper
@implementation KLTextViewPlaceholderHelper

- (void)didChange:(NSNotification *)notification {
  [self changePlaceholderHidden];
}

- (void)changePlaceholderHidden {
  self.textView.kl_lblPlaceholder.hidden = self.textView.text.length > 0;
}

- (instancetype)initWithTextView:(UITextView *)textView {
  {
    if (self = [super init]) {
      _textView = textView;
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:UITextViewTextDidChangeNotification object:textView];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:kHoomicNotificationDidChangeTextView object:textView];
    }
    return self;
  }
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end