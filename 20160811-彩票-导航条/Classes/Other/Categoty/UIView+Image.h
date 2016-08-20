//
//  UIView+Image.h
//  20160811-彩票
//
//  Created by 王旭 on 16/8/20.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 *  快速返回一个最原始的图片
 *  去掉iOS默认渲染的按钮蓝色
 *
 *  @param imageName 图片名
 *
 *  @return 图片
 */
+ (instancetype)imageWithOriRenderingImage:(NSString *)imageName;


@end
