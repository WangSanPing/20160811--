//
//  WXSettingGroup.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/19.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXSettingGroup.h"

@implementation WXSettingGroup

+ (instancetype)groupWithItems:(NSArray *)items{
    WXSettingGroup *group = [[self alloc] init];
    
    group.items = items;
    
    return group;
}

@end
