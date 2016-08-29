//
//  WXActiveMenu.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXActiveMenu.h"
#import "WXDownMenu.h"

@implementation WXActiveMenu

#pragma mark - 显示菜单
+ (instancetype)showInPoint:(CGPoint)point{
    WXActiveMenu *menu = [WXActiveMenu activeMenuy];
    menu.center = point;
    [WXKeyWindow addSubview:menu];
    return menu;
}

#pragma mark - 隐藏菜单
+ (void)hideInPoint:(CGPoint)point completion:(void (^)())completion
{
    for (WXActiveMenu *childView in WXKeyWindow.subviews) {
        if([childView isKindOfClass:self]){
            [childView setUpHideAnim:point completion:completion];
        }
    }
    
}

#pragma mark - 隐藏动画
- (void)setUpHideAnim:(CGPoint)point completion:(void (^)())completion{
    
    // 利用自动布局实现了子控件随着父控件的尺寸改变而改变.
    [UIView animateWithDuration:1 animations:^{
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        transform = CGAffineTransformTranslate(transform, -self.center.x + point.x, -self.center.y + point.y);
        
        // 修改变形，如果直接缩放为0，父控件会马上消失。故缩小为0.01
        transform = CGAffineTransformScale(transform, 0.01, 0.01);
        
        self.transform = transform;
        
    } completion:^(BOOL finished) {
        if(finished){
            [self removeFromSuperview];
            if(completion){
                completion();
            }
        }
    }];
}

/**
 *  关闭按钮
 *
 *  @param sender
 */
- (IBAction)close:(id)sender {
    
    if([_delegate respondsToSelector:@selector(activeMenuDidClickBtn:)]){
        [_delegate activeMenuDidClickBtn:self];
    }
}

+ (instancetype)activeMenuy{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}

@end
