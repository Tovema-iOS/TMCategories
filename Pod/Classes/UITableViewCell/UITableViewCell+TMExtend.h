//
//  UITableViewCell+Extend.h
//  AiChe
//
//  Created by Linxiaobin on 15/4/13.
//  Copyright (c) 2015年 orion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UITableViewCell(TMExtend)

+ (NSString *)tm_reuseIdentifier;
+ (void)tm_registerMainBundleNibToTableView:(UITableView *)tableView;
+ (void)tm_registerClassToTableView:(UITableView *)tableView;

@end
