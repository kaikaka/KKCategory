//
//  NSMutableDictionary+KL_Short.m
//  KLKit
//
//  Created by XiangKai Yin on 7/2/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "NSMutableDictionary+KL_Short.h"
#import "NSDictionary+KL_Kit.h"

@implementation NSMutableDictionary (KL_Short)

-(void)kl_setString:(NSString*)i forKey:(NSString*)key
{
  [self kl_setObject:i forKey:key];
}

-(void)kl_setBool:(BOOL)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)kl_setInt:(int)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)kl_setInteger:(NSInteger)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)kl_setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)kl_setCGFloat:(CGFloat)f forKey:(NSString *)key
{
  self[key] = @(f);
}
-(void)kl_setChar:(char)c forKey:(NSString *)key
{
  self[key] = @(c);
}
-(void)kl_setFloat:(float)i forKey:(NSString *)key
{
  self[key] = @(i);
}
-(void)kl_setDouble:(double)i forKey:(NSString*)key{
  self[key] = @(i);
}
-(void)kl_setLongLong:(long long)i forKey:(NSString*)key{
  self[key] = @(i);
}
-(void)kl_setPoint:(CGPoint)o forKey:(NSString *)key
{
  self[key] = NSStringFromCGPoint(o);
}
-(void)kl_setSize:(CGSize)o forKey:(NSString *)key
{
  self[key] = NSStringFromCGSize(o);
}
-(void)kl_setRect:(CGRect)o forKey:(NSString *)key
{
  self[key] = NSStringFromCGRect(o);
}

@end
