//
//  WXGlobal.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/18.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXGlobal.h"
#import <objc/runtime.h>

@implementation WXGlobal


/**
 输出Class下的所有属性
 Ivar 表示成员属性
 copyIvarList只能获取哪个类下面的属性，并不会越界(不会遍历父类！)
 count 输出的是属性数量
 @param Class 类
 */
+(void)showPropertyOfClass:(id)Class{
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Class class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        
        NSString *ivarName = @(ivar_getName(ivar));
        
        NSLog(@"%@",ivarName);
    }
}

@end

