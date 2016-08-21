//
//  WXActiveMenu.h
//  20160811-彩票
//
//  Created by 王旭 on 16/8/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXActiveMenu;

@protocol WXActiveMenuDelegate <NSObject>

@optional

- (void)activeMenuDidClickBtn:(WXActiveMenu *)menu;

@end

@interface WXActiveMenu : UIView

/** delegate */
@property (nonatomic,weak) id<WXActiveMenuDelegate> delegate;

/**
 *  初始化
 *
 *  @return WXActiveMenu
 */
+ (instancetype)activeMenuy;
/**
 *  显示菜单
 *
 *  @param point 要显示到哪
 *
 *  @return WXActiveMenu
 */
+ (instancetype)showInPoint:(CGPoint)point;
/**
 *  隐藏菜单
 *
 *  @param point      隐藏到哪
 *  @param completion 完成之后的操作
 */
+ (void)hideInPoint:(CGPoint)point completion:(void(^)())completion;

@end
