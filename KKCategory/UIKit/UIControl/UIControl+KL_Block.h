//
//  UIControl+KL_Block.h
//  KLKit
//
//  Created by XiangKai Yin on 7/3/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (KL_Block)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block;
- (void)removeHandlerForEvent:(UIControlEvents)event;

@end
