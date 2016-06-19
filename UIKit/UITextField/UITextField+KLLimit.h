//
//  UITextField+KLLimit.h
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (KLLimit)

/**
 *  限制字符个数
 */
@property (assign, nonatomic) NSUInteger kl_maxLength;

@end
