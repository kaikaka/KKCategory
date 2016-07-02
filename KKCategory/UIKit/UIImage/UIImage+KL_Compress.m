//
//  UIImage+KL_Compress.m
//  KLKit
//
//  Created by XiangKai Yin on 6/20/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UIImage+KL_Compress.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED>__IPHONE_6_1
int bitmapInfo = kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedLast;
#else
int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif


@implementation UIImage (KL_Compress)

+ (UIImage *)imageFromView:(UIView *)view {
  UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
  [view.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

+ (UIImage *)imageFromView:(UIView *)view rect:(CGRect)rect {
  UIImage *imageOrigent = [UIImage imageFromView:view];
  
  CGImageRef imageRef = CGImageCreateWithImageInRect(imageOrigent.CGImage, CGRectApplyAffineTransform(rect, CGAffineTransformMakeScale([UIScreen mainScreen].scale, [UIScreen mainScreen].scale)));
  UIImage *image = [UIImage imageWithCGImage:imageRef];
  CGImageRelease(imageRef);
  
  return image;
}

- (UIImage *)blurImageWithFactor:(CGFloat)factor {
  NSData  *imageData = UIImageJPEGRepresentation(self, 1);
  UIImage *destImage = [UIImage imageWithData:imageData];
  
  if (factor < 0.f || factor > 1.f) {
    factor = 0.5f;
  }
  int boxSize = (int)(factor * 40);
  boxSize = boxSize-(boxSize % 2) + 1;
  
  CGImageRef img = destImage.CGImage;
  vImage_Buffer inBuffer, outBuffer;
  vImage_Error error;
  
  void *pixelBuffer;
  
  // create vImage_Buffer with data from CGImageRef
  CGDataProviderRef inProvider = CGImageGetDataProvider(img);
  CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
  
  inBuffer.width    = CGImageGetWidth(img);
  inBuffer.height   = CGImageGetHeight(img);
  inBuffer.rowBytes = CGImageGetBytesPerRow(img);
  inBuffer.data     = (void*)CFDataGetBytePtr(inBitmapData);
  
  // create vImage_Buffer for output
  pixelBuffer = malloc(CGImageGetBytesPerRow(img)*CGImageGetHeight(img));
  if (pixelBuffer == NULL) {
    NSLog(@"No pixelbuffer");
  }
  
  outBuffer.data = pixelBuffer;
  outBuffer.width = CGImageGetWidth(img);
  outBuffer.height = CGImageGetHeight(img);
  outBuffer.rowBytes = CGImageGetBytesPerRow(img);
  
  // Create a third buffer for intermediate processing
  void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
  vImage_Buffer outBuffer2;
  outBuffer2.data = pixelBuffer2;
  outBuffer2.width = CGImageGetWidth(img);
  outBuffer2.height = CGImageGetHeight(img);
  outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
  
  // perform convolution
  error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
  if (error) {
    NSLog(@"error from convolution %ld", error);
  }
  error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
  if (error) {
    NSLog(@"error from convolution %ld", error);
  }
  error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
  if (error) {
    NSLog(@"error from convolution %ld", error);
  }
  
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef ctx = CGBitmapContextCreate(outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, bitmapInfo);
  CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
  
  UIImage *blurImage = [UIImage imageWithCGImage:imageRef];
  
  // clean up
  CGContextRelease(ctx);
  CGColorSpaceRelease(colorSpace);
  
  free(pixelBuffer);
  free(pixelBuffer2);
  CFRelease(inBitmapData);
  
  CGImageRelease(imageRef);
  
  return blurImage;
}

+ (UIImage*)scaleToSize:(CGSize)size image:(UIImage *)picture {
  CGFloat width = CGImageGetWidth(picture.CGImage);
  CGFloat height = CGImageGetHeight(picture.CGImage);
  
  float verticalRadio = size.height*1.0/height;
  float horizontalRadio = size.width*1.0/width;
  
  float radio = 1;
  if(verticalRadio>1 && horizontalRadio>1) {
    radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
  } else {
    radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
  }
  
  width = width*radio;
  height = height*radio;
  
  int xPos = (size.width - width)/2;
  int yPos = (size.height-height)/2;
  
  // 创建一个bitmap的context
  // 并把它设置成为当前正在使用的context
  UIGraphicsBeginImageContext(size);
  
  // 绘制改变大小的图片
  [picture drawInRect:CGRectMake(xPos, yPos, width, height)];
  
  // 从当前context中创建一个改变大小后的图片
  UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
  
  // 使当前的context出堆栈
  UIGraphicsEndImageContext();
  
  // 返回新的改变大小后的图片
  return scaledImage;
}

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize {
  
  UIImage *sourceImage = self;
  UIImage *newImage = nil;
  CGSize imageSize = sourceImage.size;
  CGFloat width = imageSize.width;
  CGFloat height = imageSize.height;
  CGFloat targetWidth = targetSize.width;
  CGFloat targetHeight = targetSize.height;
  CGFloat scaleFactor = 0.0;
  CGFloat scaledWidth = targetWidth;
  CGFloat scaledHeight = targetHeight;
  CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
  
  if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
    
    CGFloat widthFactor = targetWidth / width;
    
    CGFloat heightFactor = targetHeight / height;
    
    if (widthFactor > heightFactor)
      
      scaleFactor = widthFactor; // scale to fit height
    
    else
      
      scaleFactor = heightFactor; // scale to fit width
    
    scaledWidth= width * scaleFactor;
    
    scaledHeight = height * scaleFactor;
    
    // center the image
    
    if (widthFactor > heightFactor) {
      
      thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
      
    } else if (widthFactor < heightFactor) {
      
      thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
      
    }
    
  }
  
  UIGraphicsBeginImageContext(targetSize); // this will crop
  
  CGRect thumbnailRect = CGRectZero;
  
  thumbnailRect.origin = thumbnailPoint;
  
  thumbnailRect.size.width= scaledWidth;
  
  thumbnailRect.size.height = scaledHeight;
  
  [sourceImage drawInRect:thumbnailRect];
  
  newImage = UIGraphicsGetImageFromCurrentImageContext();
  
  if(newImage == nil)
    
    NSLog(@"could not scale image");
  
  //pop the context to get back to the default
  
  UIGraphicsEndImageContext();
  
  return newImage;
  
}

+ (UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height {
  float imageWidth = image.size.width;
  float imageHeight = image.size.height;
  
  float widthScale = imageWidth /width;
  float heightScale = imageHeight /height;
  
  // 创建一个bitmap的context
  // 并把它设置成为当前正在使用的context
  UIGraphicsBeginImageContext(CGSizeMake(width, height));
  
  if (widthScale > heightScale) {
    [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
  }
  else {
    [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
  }
  
  // 从当前context中创建一个改变大小后的图片
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  // 使当前的context出堆栈
  UIGraphicsEndImageContext();
  
  return newImage;
  
}

- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
  CGFloat compression = 0.7f;
  CGFloat maxCompression = 0.1f;
  NSData *imageData = UIImageJPEGRepresentation(image, compression);
  while ([imageData length] > maxFileSize && compression > maxCompression) {
    compression -= 0.1;
    imageData = UIImageJPEGRepresentation(image, compression);
  }
  
  UIImage *compressedImage = [UIImage imageWithData:imageData];
  return compressedImage;
}

- (NSData *)compressData:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
  CGFloat compression = 0.8f;
  CGFloat maxCompression = 0.1f;
  NSData *imageData = UIImageJPEGRepresentation(image, compression);
  while ([imageData length] > maxFileSize && compression > maxCompression) {
    compression -= 0.1;
    imageData = UIImageJPEGRepresentation(image, compression);
  }
  
  return imageData;
}

- (NSData *)compressImageToMaxFileSize:(NSInteger)maxFileSize {
  CGFloat compression = 0.7f;
  CGFloat maxCompression = 0.1f;
  NSData *imageData = UIImageJPEGRepresentation(self, compression);
  while ([imageData length] > maxFileSize && compression > maxCompression) {
    compression -= 0.1;
    imageData = UIImageJPEGRepresentation(self, compression);
  }
  return imageData;
}

- (void)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize atImagePath:(NSString *)imagePath {
  CGFloat compression = 0.9f;
  CGFloat maxCompression = 0.1f;
  NSData *imageData = UIImageJPEGRepresentation(image, compression);
  while ([imageData length] > maxFileSize) {
    compression -= 0.1;
    imageData = UIImageJPEGRepresentation(image, compression);
    if (compression <= maxCompression) {
      compression = 0.9f;
    }
  }
  [imageData writeToFile:imagePath atomically:YES];
}

- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize forSize:(CGSize)targetSize{
  
  UIImage *imageSize = [self compressImage:image toMaxFileSize:maxFileSize];
  NSData *data = UIImagePNGRepresentation(imageSize);
  CGFloat maxWidth = targetSize.width>targetSize.height?targetSize.width:targetSize.height;
  CGFloat minWidth = 10;
  while (data.length > maxFileSize && maxWidth > minWidth) {
    maxWidth -= 20;
    UIImage *newImage = [self compressImage:[self imageByScalingAndCroppingForSize:CGSizeMake(maxWidth, maxWidth)] toMaxFileSize:maxFileSize];
    data = UIImagePNGRepresentation(newImage);
  }
  return [UIImage imageWithData:data];
}

+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset {
  ALAssetRepresentation *assetRep = [asset defaultRepresentation];
  CGImageRef imgRef = [assetRep fullResolutionImage];
  UIImage *img = [UIImage imageWithCGImage:imgRef
                                     scale:assetRep.scale
                               orientation:(UIImageOrientation)assetRep.orientation];
  return img;
}


@end
