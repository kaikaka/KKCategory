//
//  UIButton+KL_Kit.h
//  KL_Kit
//
//  Created by XiangKai Yin on 6/19/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KL_Kit)

@property (strong, nonatomic) UIImage *kl_image;
@property (strong, nonatomic) UIImage *kl_imageHighlighted;
@property (strong, nonatomic) NSString *kl_title;
@property (strong, nonatomic) NSString *kl_titleHighlighted;
@property (strong, nonatomic) UIImage *kl_backgroundImage;
@property (strong, nonatomic) UIImage *kl_backgroundImageHighlighted;

@end

@interface UIButton (kl_VerticalLayout)

- (void)kl_centerVerticallyWithPadding:(float)padding;
- (void)kl_centerVertically;

@end