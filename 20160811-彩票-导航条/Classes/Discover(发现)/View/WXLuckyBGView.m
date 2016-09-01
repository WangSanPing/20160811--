//
//  WXLuckyBGView.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/31.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXLuckyBGView.h"

@implementation WXLuckyBGView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
 - (void)drawRect:(CGRect)rect {
     UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
     
     [image drawInRect:rect];
}


@end
