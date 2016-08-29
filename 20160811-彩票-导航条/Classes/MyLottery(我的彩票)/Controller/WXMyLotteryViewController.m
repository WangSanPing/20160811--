//
//  WXMyLotteryViewController.m
//  20180811-彩票
//
//  Created by 王旭 on 16/8/12.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXMyLotteryViewController.h"

@interface WXMyLotteryViewController ()

@end

@implementation WXMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}

// 设置左右两边的按钮
- (void)setUpNav{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(kefu) forControlEvents:UIControlEventTouchUpInside];
    // 自适应尺寸
    [btn sizeToFit];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 左边
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 右边
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriRenderingImage:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
}

- (void)setting
{
    NSLog(@"点击设置");
}

- (void)kefu
{
    NSLog(@"kefu");
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
