//
//  UITextView+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 6/30/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextView+KLLimit.h"
#import "UITextView+KL_Placeholder.h"

@interface UITextView (KL_Kit)

@end

@interface UITextView (KL_inputAccessoryView)

@property (weak, nonatomic) UIResponder *kl_lastFirstResponder;
@property (weak, nonatomic) UIResponder *kl_nextFirstResponder;
@property (assign, nonatomic) BOOL kl_showInputAccessoryView; // 自动展示klInputAccessoryView工具条

@end