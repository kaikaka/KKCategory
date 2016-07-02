//
//  UIView+KL_BlockGesture.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UIView+KL_BlockGesture.h"
#import "NSObject+KL_AssociatedObject.h"

static char kActionHandlerTapBlockKey;
static char kActionHandlerDoubleTagBlockKey;
static char kActionHandlerLongPressBlockKey;

@implementation UIView (KL_BlockGesture)

- (UITapGestureRecognizer *)kl_addTapActionWithBlock:(GestureActionBlock)block
{
  UITapGestureRecognizer *gesture = [self kl_associatedValueForKey:_cmd];
  if (!gesture)
  {
    gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(kl_handleActionForTapGesture:)];
    [self addGestureRecognizer:gesture];
    [self kl_setAssociateValue:gesture withKey:_cmd];
  }
  
  [self kl_setAssociateCopyValue:block withKey:&kActionHandlerTapBlockKey];
  self.userInteractionEnabled = YES;
  
  return gesture;
}

- (void)kl_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateRecognized)
  {
    GestureActionBlock block = [self kl_associatedValueForKey:&kActionHandlerTapBlockKey];
    if (block)
    {
      block(gesture);
    }
  }
}

- (UITapGestureRecognizer *)kl_addDoubleTapActionWithBlock:(GestureActionBlock)block {
  UITapGestureRecognizer *gesture = [self kl_associatedValueForKey:_cmd];
  if (!gesture) {
    gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(kl_handleActionForDoubleTapGesture:)];
    [gesture setNumberOfTapsRequired:2];
    [self addGestureRecognizer:gesture];
    [self kl_setAssociateValue:gesture withKey:_cmd];
  }
  
  [self kl_setAssociateCopyValue:block withKey:&kActionHandlerDoubleTagBlockKey];
  self.userInteractionEnabled = YES;
  
  return gesture;
}

- (void)kl_handleActionForDoubleTapGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateRecognized) {
    GestureActionBlock block = [self kl_associatedValueForKey:&kActionHandlerDoubleTagBlockKey];
    if (block) {
      block(gesture);
    }
  }
}

- (UILongPressGestureRecognizer *)kl_addLongPressActionWithBlock:(GestureActionBlock)block {
  UILongPressGestureRecognizer *gesture = [self kl_associatedValueForKey:_cmd];
  if (!gesture) {
    gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(kl_handleActionForLongPressGesture:)];
    [self addGestureRecognizer:gesture];
    [self kl_setAssociateValue:gesture withKey:_cmd];
  }
  
  [self kl_setAssociateCopyValue:block withKey:&kActionHandlerLongPressBlockKey];
  self.userInteractionEnabled = YES;
  
  return gesture;
}

- (void)kl_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
  if (gesture.state == UIGestureRecognizerStateBegan)
  {
    GestureActionBlock block = [self kl_associatedValueForKey:&kActionHandlerLongPressBlockKey];
    if (block) {
      block(gesture);
    }
  }
}

@end
