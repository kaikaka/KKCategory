//
//  UIView+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UIView+KL_Kit.h"
#import <objc/runtime.h>

@implementation UIView (klLayer)

- (void)setRound:(CGFloat)round {
  self.layer.cornerRadius = round;
  self.layer.masksToBounds = YES;
}

- (CGFloat)round {
  return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
  self.layer.borderWidth = borderWidth;
  self.layer.masksToBounds = YES;
}

- (CGFloat)borderWidth {
  return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
  self.layer.borderColor = borderColor.CGColor;
  self.layer.masksToBounds = YES;
}

- (UIColor *)borderColor {
  return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWith:(CGFloat)width color:(UIColor *)color {
  self.layer.borderColor = color.CGColor;
  self.layer.borderWidth = width;
  self.layer.masksToBounds = YES;
}

- (void)setKl_shadowColor:(UIColor *)kl_shadowColor {
  self.layer.shadowColor = kl_shadowColor.CGColor;
}

- (UIColor *)kl_shadowColor {
  return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setKl_shadowOffset:(CGSize)kl_shadowOffset {
  self.layer.shadowOffset = kl_shadowOffset;
}

- (CGSize)kl_shadowOffset {
  return self.layer.shadowOffset;
}

- (void)setKl_shadowRadius:(CGFloat)kl_shadowRadius {
  self.layer.shadowRadius = kl_shadowRadius;
}

- (CGFloat)kl_shadowRadius {
  return self.layer.shadowRadius;
}

- (void)setKl_shadowOpacity:(CGFloat)kl_shadowOpacity {
  self.layer.shadowOpacity = kl_shadowOpacity;
}

- (CGFloat)kl_shadowOpacity {
  return self.layer.shadowOpacity;
}

- (void)kl_setBorderWith:(CGFloat)width color:(UIColor *)color top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right {
  if (top) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.kl_width, width)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView(height)]" options:0 metrics:@{@"height": @(width)} views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
    
  }
  
  if (left) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.kl_height)];
    subView.backgroundColor = color;
    
    [self addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView(width)]" options:0 metrics:@{@"width": @(width)}  views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
  }
  
  
  if (bottom) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, self.kl_height - width, self.kl_width, width)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[subView(height)]|" options:0 metrics:@{@"height": @(width)} views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
  }
  
  
  if (right) {
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(self.kl_width - width, 0, width, self.kl_height)];
    subView.backgroundColor = color;
    [self addSubview:subView];
    
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[subView(width)]|" options:0 metrics:@{@"width": @(width)}  views:NSDictionaryOfVariableBindings(subView)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subView)];
    [self addConstraints:constraintH];
    [self addConstraints:constraintV];
  }
}

- (void)kl_setTopBorderWith:(CGFloat)width color:(UIColor *)color {[self kl_setBorderWith:width color:color top:YES left:NO bottom:NO right:NO];}
- (void)kl_setLeftBorderWith:(CGFloat)width color:(UIColor *)color {[self kl_setBorderWith:width color:color top:NO left:YES bottom:NO right:NO];}
- (void)kl_setBottomBorderWith:(CGFloat)width color:(UIColor *)color {[self kl_setBorderWith:width color:color top:NO left:NO bottom:YES right:NO];}
- (void)kl_setRightBorderWith:(CGFloat)width color:(UIColor *)color {[self kl_setBorderWith:width color:color top:NO left:NO bottom:NO right:YES];}

@end

@implementation UIView (kl_Frame)

-(CGFloat)kl_x         {   return CGRectGetMinX(self.frame);   }
-(CGFloat)kl_y         {   return CGRectGetMinY(self.frame);   }
-(CGFloat)kl_width     {   return CGRectGetWidth(self.frame);  }
-(CGFloat)kl_height    {   return CGRectGetHeight(self.frame); }
-(CGPoint)kl_origin    {   return self.frame.origin;           }
-(CGSize)kl_size       {   return self.frame.size;             }
-(CGFloat)kl_left      {   return CGRectGetMinX(self.frame);   }
-(CGFloat)kl_right     {   return CGRectGetMaxX(self.frame);   }
-(CGFloat)kl_top       {   return CGRectGetMinY(self.frame);   }
-(CGFloat)kl_bottom    {   return CGRectGetMaxY(self.frame);   }
-(CGFloat)kl_centerX   {   return self.center.x;               }
-(CGFloat)kl_centerY   {   return self.center.y;               }
-(CGPoint)kl_boundsCenter  {   return CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));   };

-(void)setKl_x:(CGFloat)kl_x
{
  CGRect frame = self.frame;
  frame.origin.x = kl_x;
  self.frame = frame;
}

-(void)setKl_y:(CGFloat)kl_y
{
  CGRect frame = self.frame;
  frame.origin.y = kl_y;
  self.frame = frame;
}

-(void)setKl_width:(CGFloat)kl_width
{
  CGRect frame = self.frame;
  frame.size.width = kl_width;
  self.frame = frame;
}

-(void)setKl_height:(CGFloat)kl_height
{
  CGRect frame = self.frame;
  frame.size.height = kl_height;
  self.frame = frame;
}

-(void)setKl_origin:(CGPoint)kl_origin
{
  CGRect frame = self.frame;
  frame.origin = kl_origin;
  self.frame = frame;
}

-(void)setKl_size:(CGSize)kl_size
{
  CGRect frame = self.frame;
  frame.size = kl_size;
  self.frame = frame;
}

-(void)setKl_left:(CGFloat)kl_left
{
  CGRect frame = self.frame;
  frame.origin.x = kl_left;
  self.frame = frame;
}

-(void)setKl_right:(CGFloat)kl_right
{
  CGRect frame = self.frame;
  frame.size.width = MAX(kl_right-self.kl_left, 0);
  self.frame = frame;
}

-(void)setKl_top:(CGFloat)kl_top
{
  CGRect frame = self.frame;
  frame.origin.y = kl_top;
  self.frame = frame;
}

-(void)setKl_bottom:(CGFloat)kl_bottom
{
  CGRect frame = self.frame;
  frame.size.height = MAX(kl_bottom-self.kl_top, 0);
  self.frame = frame;
}

-(void)setKl_centerX:(CGFloat)kl_centerX
{
  CGPoint center = self.center;
  center.x = kl_centerX;
  self.center = center;
}

-(void)setKl_centerY:(CGFloat)kl_centerY
{
  CGPoint center = self.center;
  center.y = kl_centerY;
  self.center = center;
}


@end

@implementation UIView (KL_Kit)

+ (void)load {
  Method pointInsideMethod = class_getInstanceMethod(self, @selector(pointInside:withEvent:));
  Method kl_pointInsideMethod = class_getInstanceMethod(self, @selector(kl_pointInside:withEvent:));
  
  if (pointInsideMethod && kl_pointInsideMethod) {
    method_exchangeImplementations(pointInsideMethod, kl_pointInsideMethod);
  }
  
  Method hitTestMethod = class_getInstanceMethod(self, @selector(hitTest:withEvent:));
  Method kl_hitTestMethod = class_getInstanceMethod(self, @selector(kl_hitTest:withEvent:));
  if (hitTestMethod && kl_hitTestMethod) {
    method_exchangeImplementations(hitTestMethod, kl_hitTestMethod);
  }
  
  
  Method desciptionMethod = class_getInstanceMethod(self, @selector(description));
  Method kl_desciptionMethod = class_getInstanceMethod(self, @selector(kl_description));
  if (desciptionMethod && kl_desciptionMethod) {
    method_exchangeImplementations(desciptionMethod, kl_desciptionMethod);
  }
}

- (BOOL)kl_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
  if (self.kl_pointInsideBlock) {
    return self.kl_pointInsideBlock(point, event);
  }
  
  return [self kl_pointInside:point withEvent:event];
}

- (UIView *)kl_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
  if (self.kl_hitTestBlock && !self.hidden) {
    return self.kl_hitTestBlock(point, event);
  }
  return [self kl_hitTest:point withEvent:event];
}

- (void)setKl_hitTestBlock:(UIView *(^)(CGPoint, UIEvent *))kl_hitTestBlock {
  objc_setAssociatedObject(self, @selector(kl_hitTestBlock), kl_hitTestBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIView *(^)(CGPoint, UIEvent *))kl_hitTestBlock {
  return objc_getAssociatedObject(self, @selector(kl_hitTestBlock));
}

static void *kl_pointInsideBlockKey = &kl_pointInsideBlockKey;
- (void)setKl_pointInsideBlock:(BOOL (^)(CGPoint, UIEvent *))kl_pointInsideBlock {
  objc_setAssociatedObject(self, kl_pointInsideBlockKey, kl_pointInsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL (^)(CGPoint, UIEvent *))kl_pointInsideBlock {
  return objc_getAssociatedObject(self, kl_pointInsideBlockKey);
}

- (UIView *)kl_firstResponder {
  if ([self isFirstResponder]) return self;
  
  for (UIView *subView in [self subviews]) {
    UIView *firstResponder = [subView kl_firstResponder];
    if (firstResponder) return firstResponder;
  }
  
  return nil;
}



- (NSString *)kl_description {
  id key = [self kl_key];
  NSString *description = nil;
  if (key) {
    description = [NSMutableString stringWithFormat:@"(%@)%@", key, [self kl_description]];
  } else {
    description = [self kl_description];
  }
  
  return description;
}

- (void)setKl_key:(id)kl_key {
  objc_setAssociatedObject(self, @selector(kl_key), kl_key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)kl_key {
  return objc_getAssociatedObject(self, _cmd);
}

@end

@implementation UIView (kl_Image)

- (UIImage *)kl_screenshot {
  UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, .0);
  if ([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]) {
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
  }
  
  return nil;
}

@end
