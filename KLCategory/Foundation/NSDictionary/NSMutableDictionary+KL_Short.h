//
//  NSMutableDictionary+KL_Short.h
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (KL_Short)

-(void)kl_setString:(NSString*)i forKey:(NSString*)key;

-(void)kl_setBool:(BOOL)i forKey:(NSString*)key;

-(void)kl_setInt:(int)i forKey:(NSString*)key;

-(void)kl_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)kl_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)kl_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)kl_setChar:(char)c forKey:(NSString*)key;

-(void)kl_setFloat:(float)i forKey:(NSString*)key;

-(void)kl_setDouble:(double)i forKey:(NSString*)key;

-(void)kl_setLongLong:(long long)i forKey:(NSString*)key;

-(void)kl_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)kl_setSize:(CGSize)o forKey:(NSString*)key;

-(void)kl_setRect:(CGRect)o forKey:(NSString*)key;

@end
