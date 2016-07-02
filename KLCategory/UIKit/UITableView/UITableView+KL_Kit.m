//
//  UITableView+KL_Kit.m
//  KLKit
//
//  Created by XiangKai Yin on 6/29/16.
//  Copyright © 2016 K. All rights reserved.
//

#import "UITableView+KL_Kit.h"

@implementation UITableView (KL_Kit)

- (void)deselectForSelectedRowWithAnimation:(BOOL)animation {
  NSIndexPath *indexPath = [self indexPathForSelectedRow];
  if (indexPath) {
    [self deselectRowAtIndexPath:indexPath animated:animation];
  }
}

@end
