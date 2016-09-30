//
//  WXAwardViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/9/30.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXAwardViewController.h"
#import "WXSettingCell.h"

@interface WXAwardViewController ()

@end

@implementation WXAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGroup0];
}

- (void)addGroup0
{
    
    WXSwitchSettingItem *item = [WXSwitchSettingItem itemWithImage:nil title:@"双色球"];
    item.subTitle = @"每周二、四、日开奖";
    WXSwitchSettingItem *item1 = [WXSwitchSettingItem itemWithImage:nil title:@"大乐透"];
    item1.subTitle = @"每周一、三、六开奖";
    WXSwitchSettingItem *item2 = [WXSwitchSettingItem itemWithImage:nil title:@"3D"];
    item2.subTitle = @"每天开奖、包括试机号提醒";
    WXSwitchSettingItem *item3 = [WXSwitchSettingItem itemWithImage:nil title:@"七乐彩"];
    item3.subTitle = @"每周一、三、五开奖";
    WXSwitchSettingItem *item4 = [WXSwitchSettingItem itemWithImage:nil title:@"七星彩"];
    item4.subTitle = @"每周二、五、日开奖";
    WXSwitchSettingItem *item5 = [WXSwitchSettingItem itemWithImage:nil title:@"排列3"];
    item5.subTitle = @"每天开奖";
    WXSwitchSettingItem *item6 = [WXSwitchSettingItem itemWithImage:nil title:@"排列5"];
    item6.subTitle = @"每天开奖";
    
    WXSettingGroup *group = [[WXSettingGroup alloc] init];
    group.items = @[item,item1,item2,item3,item4,item5,item6];
    
    [self.groups addObject:group];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WXSettingCell *cell = [WXSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    
    WXSettingGroup *group = self.groups[indexPath.section];
    
    WXSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
}

@end
