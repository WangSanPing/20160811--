//
//  WXArenaNavController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXArenaNavController.h"

@interface WXArenaNavController ()

@end

@implementation WXArenaNavController

+ (void)initialize{
    // 获取当前类下的所有导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 设置拉伸图片
    [bar setBackgroundImage:[UIImage imageWithStretChableImageName:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
