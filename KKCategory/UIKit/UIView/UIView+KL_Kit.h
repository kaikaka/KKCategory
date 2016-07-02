//
//  UIView+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+KL_BlockGesture.h"

@interface UIView (klLayer)

@property (nonatomic, assign) CGFloat round;   // view round
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor *borderColor;

@property (nonatomic, assign) UIColor *kl_shadowColor;
@property (nonatomic, assign) CGFloat kl_shadowRadius;
@property (assign, nonatomic) CGSize kl_shadowOffset;
@property (assign, nonatomic) CGFloat kl_shadowOpacity;

- (void)setBorderWith:(CGFloat)width color:(UIColor *)color;

- (void)kl_setBorderWith:(CGFloat)width color:(UIColor *)color top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right;
- (void)kl_setTopBorderWith:(CGFloat)width color:(UIColor *)color;
- (void)kl_setLeftBorderWith:(CGFloat)width color:(UIColor *)color;
- (void)kl_setBottomBorderWith:(CGFloat)width color:(UIColor *)color;
- (void)kl_setRightBorderWith:(CGFloat)width color:(UIColor *)color;
@end

@interface UIView (kl_Frame)

@property (nonatomic, assign) CGPoint kl_origin;
@property (nonatomic, assign) CGSize  kl_size;
@property (nonatomic, assign) CGFloat kl_x, kl_y, kl_width, kl_height;
@property (nonatomic, assign) CGFloat kl_left, kl_right, kl_top, kl_bottom;
@property (nonatomic, assign) CGFloat kl_centerX;
@property (nonatomic, assign) CGFloat kl_centerY;
@property (nonatomic, readonly) CGPoint kl_boundsCenter;

@end

@interface UIView (KL_Kit)

@property (copy, nonatomic) BOOL (^kl_pointInsideBlock)(CGPoint point, UIEvent *event);

/**
 *  @brief  block for - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;
 *      Note: write
 *          return [self kl_hitTest:point withEvent:(UIEvent *)event];
 *        at the end of block.
 */
@property (copy, nonatomic) UIView *(^kl_hitTestBlock)(CGPoint point, UIEvent *event);
- (UIView *)kl_hitTest:(CGPoint)point withEvent:(UIEvent *)event;


/**
 *  @brief  当前本view下的获取了键盘焦点的view
 *
 *  @return 如果有subView获取了焦点，返回该view  否则返回YES
 */
- (UIView *)kl_firstResponder;

/**
 *  @brief  在 `- despction` 里会用到的额外信息
 */
@property (nonatomic, strong) id kl_key;

@end

@interface UIView (kl_Image)

/**
 *  @brief  对本view截图
 *
 *  @return 截图后的UIImage
 */
- (UIImage *)kl_screenshot;

@end
