//
//  UIImage+KL_Compress.h
//  KLKit
//
//  Created by XiangKai Yin on 6/20/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface UIImage (KL_Compress)

/// 截图
+ (UIImage *)imageFromView:(UIView *)view;

/// 截图 (指定区域)
+ (UIImage *)imageFromView:(UIView *)view rect:(CGRect)rect;

//等比例放大然后裁剪尺寸
+ (UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height;

- (NSData *)compressData:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;

//等比例缩放
+ (UIImage*)scaleToSize:(CGSize)size image:(UIImage *)picture;

/// 生成模糊图片
- (UIImage *)blurImageWithFactor:(CGFloat)factor;

//图片选择器选择的ALAsset对象 转换成UIImage
+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset;

/**
 *  图片压缩到指定大小
 *
 *  @param image       图片
 *  @param maxFileSize 最大值
 *
 *  @return 图片
 */
- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;

/**
 *  图片压缩到指定大小
 *
 *  @param image       图片
 *  @param maxFileSize 最大值
 *
 *  @return 图片
 */
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

/**
 *  压缩文件到固定尺寸并传人图片路径
 *
 *  @param image       要压缩的图片
 *  @param maxFileSize 最大值
 *  @param imagePath   图片路径 包含图片名称
 */
- (void)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize atImagePath:(NSString *)imagePath;

/**
 *  根据尺寸和大小裁剪和压缩
 *
 *  @param image       图片
 *  @param maxFileSize 最大图片大小
 *  @param targetSize  图片最大尺寸
 *
 *  @return 处理过的图片
 */
- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize forSize:(CGSize)targetSize;


@end
