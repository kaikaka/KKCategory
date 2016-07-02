//
//  NSDate+KL_Kit.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KL_Kit)

+ (int)kl_ageWithDateOfBirth:(NSDate *)date;
+ (int)kl_ageWithDateOfBirthTime:(NSTimeInterval)birthTime;

/**
 *  @brief  根据时间返回相应的星座
 *
 *  @param time 要获取星座的时间
 *
 *  @return 星座名字
 */
+ (NSString *)kl_constellationWithTime:(NSTimeInterval)time;

+ (long long)kl_unixTimeInMillisecond;
+ (NSTimeInterval)kl_unixTimeInSecond;

@end
