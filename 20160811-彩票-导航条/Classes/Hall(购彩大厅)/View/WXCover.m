//
//  WXCover.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXCover.h"


@implementation WXCover

/**
 *  展示
 */
+ (void)show{

    // 创建蒙版对象
    WXCover *cover = [[WXCover alloc] initWithFrame:WXScreenBounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.6;
    
    // 把蒙版对象添加到主窗口
    [WXKeyWindow addSubview:cover];
}

/**
 *  隐藏
 */
+ (void)hide{
    for (UIView *childView in WXKeyWindow.subviews) {
        // 判断是否为当前类
        if([childView isKindOfClass:self]){
            
            [childView removeFromSuperview];
            
        }
    }
}

@end
