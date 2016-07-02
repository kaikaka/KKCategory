//
//  NSURLRequest+KL_TypeCheck.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (KL_TypeCheck)

- (BOOL)kl_isTel;
- (BOOL)kl_isSms;
- (BOOL)kl_isMail;

@end
