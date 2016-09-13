//
//  WXSaveTool.h
//  20160811-彩票
//
//  Created by 王旭 on 16/9/13.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXSaveTool : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
