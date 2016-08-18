//
//  WXTabBar.m
//  20180811-彩票
//
//  Created by 王旭 on 16/8/15.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXTabBar.h"
#import "WXTabBarButton.h"

@interface WXTabBar()

/** 用于保存上次点击的button */
@property (nonatomic,weak) WXTabBarButton *selBtn;

@end

@implementation WXTabBar

- (void)setItems:(NSArray *)items{
    _items = items;
    
    for (UITabBarItem *item in items) {
        
        WXTabBarButton *btn = [WXTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = self.subviews.count;
        
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        if (self.subviews.count == 1){
            [self btnClick:btn];
        }
    }
}

- (void)btnClick:(WXTabBarButton *)btn{
    _selBtn.selected = NO;
    
    btn.selected = YES;
    
    _selBtn = btn;
    
    if([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]){
        [_delegate tabBar:self didClickBtn:btn.tag];
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
