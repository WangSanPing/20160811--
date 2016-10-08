//
//  WXSettingViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/13.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXSettingViewController.h"
#import "WXBlurView.h"
#import "MBProgressHUD+XMG.h"
#import "WXPushViewController.h"
#import "WXHelpViewController.h"


@interface WXSettingViewController ()

@end

@implementation WXSettingViewController


- (instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题"  style:UIBarButtonItemStyleBordered target:self action:@selector(help)];
    
    
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
}

- (void)help{
    WXHelpViewController *vc = [[WXHelpViewController alloc] init];
    vc.title = @"帮助";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - void Of mine
/**
 第1组
 */
- (void)setUpGroup0{
    WXArrowSettingItem *item = [WXArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    item.destVc = [UIViewController class];
    
    WXArrowSettingItem *item1 = [WXArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码111"];
    WXArrowSettingItem *item2 = [WXArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码222"];
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item,item1,item2]];
    
    [self.groups addObject:group];
}

/**
 第2组
 */
- (void)setUpGroup1{
    WXArrowSettingItem *item = [WXArrowSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"推送和提醒"];
    item.destVc = [WXPushViewController class];
    
    WXSwitchSettingItem *item1 = [WXSwitchSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码111"];
    
    item1.isOn = YES;
    WXSwitchSettingItem *item2 = [WXSwitchSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码222"];
    item2.isOn = NO;
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item,item1,item2]];
    
    [self.groups addObject:group];
}

/**
 第3组
 */
- (void)setUpGroup2{
    WXSettingItem *item = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"检查新版本"];
    
    item.itemOpertion = ^(NSIndexPath *indexPath){
        WXBlurView *blurView = [[WXBlurView alloc] initWithFrame:WXScreenBounds];
        
        [WXKeyWindow addSubview:blurView];
        
        [MBProgressHUD showSuccess:@"当前没有最新的版本"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [blurView removeFromSuperview];
        });
    };
    WXSettingItem *item1 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码111"];
    WXSettingItem *item2 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码222"];
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item,item1,item2]];
    
    [self.groups addObject:group];
}

@end


















