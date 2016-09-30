//
//  WXScoreViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/9/30.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXScoreViewController.h"

@interface WXScoreViewController ()

@end

@implementation WXScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup0];
    
    [self addGroup1];
    
    [self addGroup1];
    [self addGroup1];
    [self addGroup1];
    [self addGroup1];
}

- (void)addGroup0
{
    WXSettingItem *item = [WXSwitchSettingItem itemWithImage:nil title:@"推送我关注的比赛"];
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item]];
    group.footTitle = @"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我";
    [self.groups addObject:group];
    
}

- (void)addGroup1{
    WXSettingItem *item = [WXSettingItem itemWithImage:nil title:@"起始时间"];
    item.subTitle = @"00:00";
    
    // bolck会把代码里所有的强指针全部强引用
    // 用__weak 重新定义需要使用的类解决
    
    // __weak WXScoreViewController *weakSelf = self;
    
    // 也可以用typeof获取括号里面的类型
    __weak typeof(self) weakSelf = self;
    
    
    item.itemOpertion = ^(NSIndexPath *indexPath){
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // iOS7之后只要在cell上添加textField都自动做了键盘处理
        UITextField *text = [[UITextField alloc] init];
        
        [text becomeFirstResponder];// 弹出键盘
        
        [cell addSubview:text];
    };
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item]];
    group.headTitle = @"只在以下时间段接收比分直播推送";
    
    [self.groups addObject:group];
    
}



@end
