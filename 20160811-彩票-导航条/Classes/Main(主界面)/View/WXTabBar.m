//
//  WXTabBar.m
//  20180811-彩票
//
//  Created by 王旭 on 16/8/15.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXTabBar.h"

@implementation WXTabBar

- (void)setItems:(NSArray *)items{
    _items = items;
    
    for (UITabBarItem *item in items) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat h = self.bounds.size.height;
    
    for (int i = 0; i < count; i++) {
        
        UIButton *btn = self.subviews[i];
        
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
    }
}

@end
