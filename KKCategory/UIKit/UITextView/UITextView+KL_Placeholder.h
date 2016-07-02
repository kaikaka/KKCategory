//
//  UITextView+KL_Placeholder.h
//  KLKit
//
//  Created by XiangKai Yin on 6/30/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief  给UITextView加上占位符
 */
@interface UITextView (KL_Placeholder)

@property (strong, nonatomic) NSString *kl_placeholder;      // 占位符文字
@property (strong, nonatomic) UIColor  *kl_placeholderColor; // 占位符颜色
@property (strong, nonatomic) UIFont   *kl_placeholderFont;  // 占位符字体


/**
 *  @brief  默认为NO。
 *          UITextView中手动更改text（即：textView.text = text）时，不会主动
 *       发送UITextViewTextDidChangeNotification通知。该通知只有在用户界面上
 *       输入文字时才会发送。本属性如果设置为YES的话，在textView.text = text时，
 *       也主动触发该通知；否则不触发。
 */
@property (assign, nonatomic) BOOL kl_isDidChangePostNotification;

@end
