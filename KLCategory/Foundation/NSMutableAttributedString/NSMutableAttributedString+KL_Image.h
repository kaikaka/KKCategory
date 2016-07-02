//
//  NSMutableAttributedString+KL_Image.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (KL_Image)

- (void)kl_insertImage:(UIImage *)image atIndex:(NSUInteger)index left:(CGFloat)left height:(CGFloat)height;
- (void)kl_insertImage:(UIImage *)image atIndex:(NSUInteger)index height:(CGFloat)height;
- (void)kl_insertImage:(UIImage *)image atIndex:(NSUInteger)index size:(CGSize)size;
- (void)kl_insertImage:(UIImage *)image atIndex:(NSUInteger)index frame:(CGRect)frame;
- (void)kl_insertImage:(UIImage *)image atIndex:(NSUInteger)index;

- (UIFont *)kl_font;

@end
