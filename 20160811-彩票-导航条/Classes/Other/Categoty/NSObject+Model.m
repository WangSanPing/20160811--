//
//  NSObject+Model.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/10/4.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/runtime.h>

@implementation NSObject (Model)

+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict{
    id objc = [[self alloc] init];
    
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        
        // 拿到属性名
        NSString *ivarName = @(ivar_getName(ivar));
        
        // 去掉第一个字符
        ivarName = [ivarName substringFromIndex:1];
        
        id value = dict[ivarName];
        
        if(value == nil){
            if(mapDict){
                NSString *keyName = mapDict[ivarName];
                
                value = dict[keyName];
            }
        }
        
        [objc setValue:value forKey:ivarName];
    }
    
    return objc;
}

@end
