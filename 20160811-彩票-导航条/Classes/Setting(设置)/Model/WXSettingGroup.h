//
//  WXSettingGroup.h
//  20160811-彩票
//
//  Created by 王旭 on 16/9/19.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXSettingGroup : NSObject

/** WXSettingItem */
@property (nonatomic, strong) NSArray *items;

/** headTitle */
@property (nonatomic, strong) NSString *headTitle;

/** footTitle */
@property (nonatomic, strong) NSString *footTitle;

+ (instancetype)groupWithItems:(NSArray *)items;

@end
