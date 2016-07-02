//
//  UIButton+KL_Block.h
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^KLButtonActionBlock)();

@interface UIButton (KL_Block)

/**
 *  @brief  给按钮加上click事件
 *
 *  @param action 当按钮click时要执行的block。
 */
- (void)kl_handleClickBlock:(KLButtonActionBlock)action;

/**
 *  @brief 给按钮加上block事件
 *
 *  @param events 要响应的事件
 *  @param action 当events触发时，要执行的block
 */
- (void)kl_handleControlEvents:(UIControlEvents)events withBlock:(KLButtonActionBlock)action;


@end
