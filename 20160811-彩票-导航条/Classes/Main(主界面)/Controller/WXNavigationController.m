//
//  WXNavigationController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/18.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXNavigationController.h"

@interface WXNavigationController()

@end

@implementation WXNavigationController

// 当前类或者他的子类第一次使用的时候才会调用
+ (void)initialize
{
    // 获取当前类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条标题颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    [bar setTitleTextAttributes:titleAttr];
}
@end
