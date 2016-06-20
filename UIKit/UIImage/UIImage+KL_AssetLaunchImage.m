//
//  UIImage+KL_AssetLaunchImage.m
//  KLKit
//
//  Created by XiangKai Yin on 6/20/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UIImage+KL_AssetLaunchImage.h"

@implementation UIImage (KL_AssetLaunchImage)

+ (UIImage *)kl_assetLaunchImage {
  NSString *name = [self kl_assetLaunchImageName];
  UIImage *launchImage = [UIImage imageNamed:name];
  return launchImage;
}

+ (NSString *)kl_assetLaunchImageName {
  NSDictionary *dict = @{@"320x480" : @"LaunchImage-700",
                         @"320x568" : @"LaunchImage-700-568h",
                         @"375x667" : @"LaunchImage-800-667h",
                         @"414x736" : @"LaunchImage-800-Portrait-736h"};
  NSString *key = [NSString stringWithFormat:@"%dx%d",
                   (int)[UIScreen mainScreen].bounds.size.width,
                   (int)[UIScreen mainScreen].bounds.size.height];
  NSString *name = dict[key];
  return name;
}

+ (NSString *)kl_assetLaunchImagePath {
  NSString *name = [self kl_assetLaunchImageName];
  NSString *fileName = [NSString stringWithFormat:@"%@@%dx", name, (int)[UIScreen mainScreen].scale];
  NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
  return path;
}

+ (UIImage *)kl_assetLaunchImageNoCache {
  UIImage *launchImage = [UIImage imageWithContentsOfFile:[self kl_assetLaunchImagePath]];
  return launchImage;
}

@end
