//
//  NSObject+Model.h
//  20160811-彩票
//
//  Created by 王旭 on 2016/10/4.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
