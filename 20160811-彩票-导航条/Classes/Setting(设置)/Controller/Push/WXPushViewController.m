//
//  WXPushViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/9/30.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXPushViewController.h"
#import "WXAwardViewController.h"
#import "WXScoreViewController.h"
#import "WXArrowSettingItem.h"
#import "WXSettingGroup.h"


@interface WXPushViewController ()

@end

@implementation WXPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGroup1];
}

- (void)setUpGroup1{
    WXArrowSettingItem *redeemCode = [WXArrowSettingItem itemWithImage:nil title:@"开奖推送"];
    
    redeemCode.destVc = [WXAwardViewController class];
    
    WXArrowSettingItem *item = [WXArrowSettingItem itemWithImage:nil title:@"比分直播"];
    item.destVc = [WXScoreViewController class];
    
    WXArrowSettingItem *item1 = [WXArrowSettingItem itemWithImage:nil title:@"比分直播"];
    WXArrowSettingItem *item2 = [WXArrowSettingItem itemWithImage:nil title:@"比分直播"];
    
    WXSettingGroup *group = [WXSettingGroup groupWithItems:@[redeemCode,item,item1,item2]];
    
    [self.groups addObject:group];

}

@end
