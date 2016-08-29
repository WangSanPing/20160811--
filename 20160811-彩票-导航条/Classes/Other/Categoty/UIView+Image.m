//
//  UIView+Image.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/20.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "UIView+Image.h"

@implementation UIImage (Image)

/**
 *  快速返回一个最原始的图片
 *  去掉iOS默认渲染的按钮蓝色
 *
 *  @param imageName 图片名
 *
 *  @return 图片
 */
+ (instancetype)imageWithOriRenderingImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

/**
 *  快速拉伸图片
 *
 *  @param imageName imageName
 *
 *  @return image
 */
+ (instancetype)imageWithStretChableImageName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

+ (instancetype)imageWithStretChableImageName:(NSString *)imageName width:(CGFloat)width height:(CGFloat)height{
    
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * width topCapHeight:image.size.height * height];
}
@end
