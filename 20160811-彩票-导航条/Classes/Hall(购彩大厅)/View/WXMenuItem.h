//
//  WXMenuItem.h
//  20160811-彩票
//
//  Created by 王旭 on 16/8/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXMenuItem : NSObject

/** titel */
@property (nonatomic,strong) NSString *title;

/** image */
@property (nonatomic,strong) UIImage *image;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

@end
