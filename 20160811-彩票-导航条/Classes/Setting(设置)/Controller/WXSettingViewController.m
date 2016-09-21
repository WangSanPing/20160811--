//
//  WXSettingViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/13.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXSettingViewController.h"

#import "WXSettingItem.h"
#import "WXSettingGroup.h"

@interface WXSettingViewController ()

/** 记录当前tableView的所有数组 */
@property (nonatomic, strong) NSMutableArray *groups;

@end

@implementation WXSettingViewController

- (NSMutableArray *)groups{
    if(_groups == nil){
        _groups = [NSMutableArray array];
    }
    
    return _groups;
}

- (instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
}

#pragma mark - void Of mine


/**
 第1组
 */
- (void)setUpGroup0{
    WXSettingItem *item = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    WXSettingItem *item1 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码111"];
    WXSettingItem *item2 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码222"];
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item,item1,item2]];
    
    [self.groups addObject:group];
}

/**
 第2组
 */
- (void)setUpGroup1{
    WXSettingItem *item = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    WXSettingItem *item1 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码111"];
    WXSettingItem *item2 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码222"];
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item,item1,item2]];
    
    [self.groups addObject:group];
}

/**
 第3组
 */
- (void)setUpGroup2{
    WXSettingItem *item = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    WXSettingItem *item1 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码111"];
    WXSettingItem *item2 = [WXSettingItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码222"];
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[item,item1,item2]];
    
    [self.groups addObject:group];
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
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    WXSettingGroup *group = self.groups[indexPath.section];
    
    WXSettingItem *item = group.items[indexPath.row];
    
    cell.textLabel.text = item.title;
    cell.imageView.image = item.image;
    
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
}
@end


















