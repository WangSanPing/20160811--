//
//  WXSettingCell.h
//  20160811-彩票
//
//  Created by 王旭 on 2016/9/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WXSettingItem;

@interface WXSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

/** item */
@property (nonatomic, strong) WXSettingItem *item;



@end
