//
//  UIButton+KL_Block.m
//  KLKit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UIButton+KL_Block.h"
#import "NSObject+KL_AssociatedObject.h"

@implementation UIButton (KL_Block)

- (void)kl_handleClickBlock:(KLButtonActionBlock)action {
  [self kl_handleControlEvents:UIControlEventTouchUpInside withBlock:action];
}

- (void)kl_handleControlEvents:(UIControlEvents)events withBlock:(KLButtonActionBlock)action {
  [self kl_setAssociateCopyValue:action withKey:@selector(kl_handleControlEvents:withBlock:)];
  [self addTarget:self action:@selector(kl_buttonAction:) forControlEvents:events];
}

- (void)kl_buttonAction:(id)sender {
  KLButtonActionBlock block = (KLButtonActionBlock)[self kl_associatedValueForKey:@selector(kl_handleControlEvents:withBlock:)];
  if (block) {
    self.enabled = NO;
    block();
    self.enabled = YES;
  }
}

@end
