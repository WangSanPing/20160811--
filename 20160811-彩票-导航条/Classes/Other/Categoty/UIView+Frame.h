//
//  UIView+Frame.h
//  20160811-彩票
//
//  Created by 王旭 on 16/8/20.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>

// @property如果在分类里面只会生成get,set方法的声明，并不会生成成员属性
@interface UIView (Frame)

/** height */
@property (nonatomic,assign) CGFloat height;
/** width */
@property (nonatomic,assign) CGFloat width;
/** x */
@property (nonatomic,assign) CGFloat x;
/** y */
@property (nonatomic,assign) CGFloat y;

@end
