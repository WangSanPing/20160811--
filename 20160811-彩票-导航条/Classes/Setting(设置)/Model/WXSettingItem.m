//
//  WXSettingItem.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/19.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXSettingItem.h"

@implementation WXSettingItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title{
    WXSettingItem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}

@end
