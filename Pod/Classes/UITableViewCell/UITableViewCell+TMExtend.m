//
//  UITableViewCell+Extend.m
//  AiChe
//
//  Created by Linxiaobin on 15/4/13.
//  Copyright (c) 2015年 orion. All rights reserved.
//

#import "UITableViewCell+TMExtend.h"

@implementation UITableViewCell (TMExtend)

+ (NSString *)tm_reuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (void)tm_registerMainBundleNibToTableView:(UITableView *)tableView
{
    if (tableView) {
        NSString *identifier = [self tm_reuseIdentifier];
        UINib *cellNib = [UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]];
        [tableView registerNib:cellNib forCellReuseIdentifier:identifier];
    }
}

+ (void)tm_registerClassToTableView:(UITableView *)tableView
{
    if (tableView) {
        NSString *identifier = [self tm_reuseIdentifier];
        [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
    }
}

@end
