//
//  UIImage+KL_AssetLaunchImage.h
//  KLKit
//
//  Created by XiangKai Yin on 6/20/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief  支持从Asset Catalog中读取launchImage
 *        因为目前iOS还没有API能直接读取asset catalog中的launchImage。
 *
 *      refer:http://stackoverflow.com/questions/19107543/xcode-5-asset-catalog-how-to-reference-the-launchimage/20045142#20045142
 */

@interface UIImage (KL_AssetLaunchImage)

+ (UIImage *)kl_assetLaunchImage;
+ (NSString *)kl_assetLaunchImageName;
+ (NSString *)kl_assetLaunchImagePath;
+ (UIImage *)kl_assetLaunchImageNoCache;

@end
