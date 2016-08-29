//
//  WXArenaTableController.m
//  20180811-彩票
//
//  Created by 王旭 on 16/8/12.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXArenaTableController.h"

@interface WXArenaTableController ()

@end

@implementation WXArenaTableController

- (void)loadView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:WXScreenBounds];
    
    // 设置图片可以与用户交互，否则在图片上添加的如按钮等控件的时间无法响应
    // 即事件无法传递
    imageView.userInteractionEnabled = YES;
    
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    
    self.view = imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    seg.width += 40;
    
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    seg.selectedSegmentIndex = 0;//默认选中第一个
    
    // 设置边框颜色
    seg.tintColor = [UIColor colorWithRed:0/255.0 green:142/255.0 blue:143/255.0 alpha:1];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [seg setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    self.navigationItem.titleView = seg;
}


@end
