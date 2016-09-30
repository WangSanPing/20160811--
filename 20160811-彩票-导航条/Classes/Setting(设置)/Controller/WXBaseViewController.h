//
//  WXBaseViewController.h
//  20160811-彩票
//
//  Created by 王旭 on 2016/9/29.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXSettingItem.h"
#import "WXSwitchSettingItem.h"
#import "WXArrowSettingItem.h"
#import "WXSettingGroup.h"

@interface WXBaseViewController : UITableViewController

/** 记录当前tableView的所有数组 */
@property (nonatomic, strong) NSMutableArray *groups;

@end
