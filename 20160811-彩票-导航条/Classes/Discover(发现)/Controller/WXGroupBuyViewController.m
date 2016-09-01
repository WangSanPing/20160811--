//
//  WXGroupBuyViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/31.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXGroupBuyViewController.h"
#import "WXTitleView.h"

@interface WXGroupBuyViewController ()

/** titleView */
@property (nonatomic,strong) UIButton *titleView;

@end

@implementation WXGroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *titleView = [WXTitleView buttonWithType:UIButtonTypeCustom];
    _titleView = titleView;
    
    [titleView setTitle:@"全部彩种" forState:UIControlStateNormal];
    [titleView setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    [titleView sizeToFit];
    self.navigationItem.titleView = titleView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"助手" style:UIBarButtonItemStylePlain target:self action:@selector(help)];
}

- (void)help{
    [_titleView setImage:nil forState:UIControlStateNormal];
    
    NSLog(@"%s",__func__);
}

@end
