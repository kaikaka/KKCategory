//
//  KLFoundationMethods.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef KLFoundationMethodsC
#define KLFoundationMethodsC

#if defined __cplusplus
extern "C" {
#endif
  
  /**
   *  @brief  判断value是否在区间[min, max]内
   *
   *  @param value 要判断的value
   *  @param min   区间最小值
   *  @param max   区间最大值
   *
   *  @return 如果在区间内返回true; 否则返回false
   */
#define KLInBound(value, min, max) \
({\
bool inBound = false;\
if ((min) <= value && value <= (max)) {\
inBound = true; \
}\
inBound;\
})
  
  
#if defined __cplusplus
};
#endif

#endif

/**
 *  @brief  修复在当前分辨率下的用于屏幕上的数值
 *        比如在6 plus下的3倍分辨率下，某view的高度为183.12;
 *        用本方法修复后，返回的值为183.333333;
 */

@interface KLFoundationMethods : NSObject

+ (CGFloat)fixResolutionValue:(CGFloat)value;

@end
