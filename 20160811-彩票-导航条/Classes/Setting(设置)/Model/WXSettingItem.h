//
//  WXSettingItem.h
//  20160811-彩票
//
//  Created by 王旭 on 16/9/19.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXSettingItem.h"

@interface WXSettingItem : NSObject

/** image */
@property (nonatomic, strong) UIImage *image;

/** title */
@property (nonatomic, strong) NSString *title;

/** sub */
@property (nonatomic, strong) NSString *subTitle;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

/** 用来保存每一行cell的功能 */
@property (nonatomic, strong)  void(^itemOpertion)(NSIndexPath *);

@end
