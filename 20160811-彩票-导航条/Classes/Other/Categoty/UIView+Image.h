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

/**
 *  快速拉伸图片
 *
 *  @param imageName imageName
 *
 *  @return image
 */
+ (instancetype)imageWithStretChableImageName:(NSString *)imageName;


/**
 *  快速拉伸图片
 *
 *  @param imageName imageName
 *  @param width     width
 *  @param height    heigth
 *
 *  @return image
 */
+ (instancetype)imageWithStretChableImageName:(NSString *)imageName width:(CGFloat)width height:(CGFloat)height;


@end
