//
//  KLInputAccessoryView.h
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLInputAccessoryView : UIToolbar

@property (weak, nonatomic) UIResponder *targert;
@property (weak, nonatomic) UIResponder *lastFirstResponder;
@property (weak, nonatomic) UIResponder *nextFirstResponder;
@property (copy, nonatomic) void (^doneBlock)(void);


/**
 *  @brief  初始化键盘工具条
 *
 *  @param targert            要将工具条添加到的目标
 *  @param lastFirstResponder 上一个要获取键盘焦点的响应器
 *  @param nextFirstResponder 下一个要获取键盘焦点的响应器
 *  @param doneBlock          点击完成后要做的事
 *
 *  @return 本工具条
 */
- (instancetype)initWithTargert:(UIResponder *)targert last:(UIResponder *)lastFirstResponder next:(UIResponder *)nextFirstResponder doneBlock:(void(^)(void))doneBlock;


@end
