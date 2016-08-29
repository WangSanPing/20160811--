//
//  WXMenuItem.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXMenuItem.h"

@implementation WXMenuItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title{
    
    WXMenuItem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
    
}

@end
