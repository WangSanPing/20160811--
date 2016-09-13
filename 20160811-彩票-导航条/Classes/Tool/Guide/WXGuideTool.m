//
//  WXGuideTool.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/13.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXGuideTool.h"
#import "WXSaveTool.h"
#import "WXTabBarController.h"
#import "WXNewFeatureViewController.h"

#define WXVersionKey @"version"

@implementation WXGuideTool

+ (UIViewController *)chooseRootViewController{
    
    // 判断下有没有最近的版本号
    
    // 从info.list中获取最新的版本号
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    // 获取上一次的版本号
    NSString *oldVersion = [WXSaveTool objectForKey:WXVersionKey];
    
    UIViewController *rootVC = nil;
    
    if([curVersion isEqualToString:oldVersion]){
        rootVC = [[WXTabBarController alloc] init];
    }else{
        
        rootVC = [[WXNewFeatureViewController alloc] init];
        [WXSaveTool setObject:curVersion forKey:WXVersionKey];
    }
    
    return rootVC;
}

@end
