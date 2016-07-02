//
//  NSData+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSData+KL_Kit.h"

@implementation NSData (KL_Kit)

- (BOOL)kl_isGifData {
  if (self.length > 4) {
    const unsigned char *bytes = [self bytes];
    return bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46;
  }
  
  return NO;
}

@end
