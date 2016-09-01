//
//  WXTitleView.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/31.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXTitleView.h"

@implementation WXTitleView


- (void)layoutSubviews{
    [super layoutSubviews];
    
    if(self.imageView.x < self.titleLabel.x){
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}

@end
