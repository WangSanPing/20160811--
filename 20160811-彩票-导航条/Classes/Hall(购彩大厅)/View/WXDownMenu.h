//
//  WXDownMenu.h
//  20160811-彩票
//
//  Created by 王旭 on 16/8/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXDownMenu : UIView

/**
 *  初始化
 *
 *  @param view  要展示到的view
 *  @param items 按钮数组
 *  @param oriY  Y值
 *
 *  @return view
 */
+ (instancetype)showInView:(UIView *)view items:(NSArray *)items oriY:(CGFloat)oriY;

/**
 *  隐藏
 */
- (void)hide;

@end

