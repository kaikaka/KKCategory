//
//  NSArray+KL_Functional.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (KL_Functional)

/**
 *  @brief  将本数组里的每一个对象映射成一个另一个对象，并保存到新的数组中
 *
 *  @param block 映射block，不能为nil   接收的参数都是本数组里的对象，可以返回nil。如果返回nil，则会封装为[NSNull null]加到新的数组中。
 *
 *  @return 映射好的新的数组。可能为nil
 */
- (NSArray *)kl_map:(id(^)(id object))block;

/**
 *  @brief  对数组进行过滤
 *
 *  @param block 过滤的block，不能为nil   该block接收的参数为本数组里的每一个对象。如果返回YES，则该对象会加入到新的数组中；
 *                                  否则就认为该对象被过滤掉了
 *
 *  @return 新的过滤后的数组。可能为nil
 */
- (NSArray *)kl_filter:(BOOL(^)(id object))block;

/**
 *  @brief  返回这样的结果：重复对`combineBlock`进行调用，该block的第一个参数，是`initValue`，第二个参数是`self`中的按顺序的每一个
 *      元素；然后下一次调用时，再用上一次返回的值作为新的`initValue`再次调用...
 *      比如：return `combine(combine(...combine(combine(initial, self[0]),self[1)],...self[cout-2),self[count-1])`.
 *
 *  @param initValue    初始值
 *  @param combineBlock 联合计算的block
 *
 *  @return 联合计算的值
 */
- (id)kl_reduce:(id)initValue combine:(id (^)(id value, id each))combineBlock;

/**
 *  @brief  A Array containing the elements of `self` in reverse order
 *
 *  @return return a new array.
 */
- (NSArray *)kl_reverse;

@end
