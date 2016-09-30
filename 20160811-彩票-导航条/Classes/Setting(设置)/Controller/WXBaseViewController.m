//
//  WXBaseViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/9/29.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXBaseViewController.h"
#import "WXSettingCell.h"


@interface WXBaseViewController ()


@end


@implementation WXBaseViewController

- (NSMutableArray *)groups{
    if(_groups == nil){
        _groups = [NSMutableArray array];
    }
    
    return _groups;
}
 
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - delegate

/**
 每组返回多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    WXSettingGroup *group = _groups[section];
    
    return group.items.count;
}

/**
 返回多少组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _groups.count;
}

/**
 返回什么cell的样式
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WXSettingCell *cell = [WXSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    // 取出哪组
    WXSettingGroup *group = self.groups[indexPath.section];
    
    // 取出行
    WXSettingItem *item = group.items[indexPath.row];
    
    // 给cell传递模型
    cell.item = item;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    WXSettingGroup *group = _groups[section];
    
    return group.headTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    WXSettingGroup *group = _groups[section];
    
    return group.footTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出哪组
    WXSettingGroup *group = self.groups[indexPath.section];
    
    // 取出行
    WXSettingItem *item = group.items[indexPath.row];
    
    if(item.itemOpertion){
        item.itemOpertion(indexPath);
        
        return;
    }
    
    if([item isKindOfClass:[WXArrowSettingItem class]]){
        WXArrowSettingItem *arrowItem = (WXArrowSettingItem *)item;
        
        if(arrowItem.destVc){
            UIViewController *vc = [[arrowItem.destVc alloc] init];
            
            vc.title = arrowItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
