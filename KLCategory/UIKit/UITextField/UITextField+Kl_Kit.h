//
//  UITextField+Kl_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+KLLimit.h"
#import "KLInputAccessoryView.h"

@interface UITextField (Kl_Kit)

@end

/**
 *  @brief  UITextFieldDelegate的快捷方法  注意：当你自己设置了UITextField的delegate时，这里面的内容都将失效
 */
@interface UITextField (kl_textFieldDelegate)

/**
 *  @brief  当点击return key后的下一个获取键盘焦点的对象
 */
@property (weak, nonatomic) UIResponder *kl_nextFirstResponder;

/**
 *  @brief  当点击return key后调用的block
 *
 *  @param returnKeyBlock 点击return key后调用的block
 */
- (void)kl_returnKeyBlock:(void(^)(void))returnKeyBlock;

@end

@interface UITextField (kl_inputAccessoryView)

@property (weak, nonatomic) UIResponder *kl_lastFirstResponder;
@property (assign, nonatomic) BOOL kl_showInputAccessoryView; // 自动展示klInputAccessoryView工具条

@end