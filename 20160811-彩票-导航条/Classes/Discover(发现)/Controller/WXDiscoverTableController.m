//
//  WXDiscoverTableController.m
//  20180811-彩票
//
//  Created by 王旭 on 16/8/12.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXDiscoverTableController.h"

@interface WXDiscoverTableController ()

@end

@implementation WXDiscoverTableController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%s",__func__);
    
    // 得到即将跳转的controller
    UIViewController *vc = segue.destinationViewController;
    // 隐藏底部导航条
    vc.hidesBottomBarWhenPushed = YES;
}
@end