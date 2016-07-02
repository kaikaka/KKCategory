//
//  UIView+KL_BlockGesture.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (KL_BlockGesture)

- (UITapGestureRecognizer *)kl_addTapActionWithBlock:(GestureActionBlock)block;
- (UITapGestureRecognizer *)kl_addDoubleTapActionWithBlock:(GestureActionBlock)block;
- (UILongPressGestureRecognizer *)kl_addLongPressActionWithBlock:(GestureActionBlock)block;

@end
