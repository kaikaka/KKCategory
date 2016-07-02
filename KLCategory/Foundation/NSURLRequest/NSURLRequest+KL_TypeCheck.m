//
//  NSURLRequest+KL_TypeCheck.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSURLRequest+KL_TypeCheck.h"

@implementation NSURLRequest (KL_TypeCheck)

- (BOOL)kl_isTel {
  return [[[self URL] absoluteString] hasPrefix:@"tel:"];
}

- (BOOL)kl_isSms {
  return [[[self URL] absoluteString] hasPrefix:@"sms:"];
}

- (BOOL)kl_isMail {
  return [[[self URL] absoluteString] hasPrefix:@"mailto:"];
}

@end
