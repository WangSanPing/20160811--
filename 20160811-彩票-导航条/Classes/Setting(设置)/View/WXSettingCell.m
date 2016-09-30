//
//  WXSettingCell.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/9/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXSettingCell.h"

#import "WXArrowSettingItem.h"
#import "WXSwitchSettingItem.h"

@interface WXSettingCell()

/** 箭头 */
@property (nonatomic, strong) UIImageView *arrowView;

/** 开关 */
@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation WXSettingCell

- (UIImageView *)arrowView{
    if(_arrowView == nil){
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    
    return _arrowView;
}

- (UISwitch *)switchView{
    if(_switchView == nil){
        _switchView = [[UISwitch alloc] init];
    }
    
    return _switchView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    static NSString *ID = @"cell";
    
    WXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        cell = [[WXSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setItem:(WXSettingItem *)item{
    _item = item;
    
    [self setUpData];
    
    [self setUpAccessoryView];
}

- (void)setUpData{
    
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    self.imageView.image = _item.image;
    
}

/**
 判断种类给每行的右边赋值
 */
- (void)setUpAccessoryView{
    if([_item isKindOfClass:[WXArrowSettingItem class]]){
        
        self.accessoryView = self.arrowView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;

    }else if ([_item isKindOfClass:[WXSwitchSettingItem class]]){
        
        WXSwitchSettingItem *item = (WXSwitchSettingItem *)_item;
        [self.switchView setOn:item.isOn];
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else{
        
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;

    }
}

@end

































