//
//  WXTabBar.h
//  20180811-彩票
//
//  Created by 王旭 on 16/8/15.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WXTabBar;

@protocol WXTabBarDelegate <NSObject>

@optional

- (void)tabBar:(WXTabBar *)tabBar didClickBtn:(NSInteger)index;

@end

@interface WXTabBar : UIView

/** UITabBarItem */
@property (nonatomic,strong) NSArray *items;

/** delegate */
@property (nonatomic,weak) id<WXTabBarDelegate> delegate;

@end
