//
//  WXHtmlItem.h
//  20160811-彩票
//
//  Created by 王旭 on 2016/10/4.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXHtmlItem : NSObject

/** title */
@property (nonatomic, strong) NSString *title;

/** html */
@property (nonatomic, strong) NSString *html;

/** id */
@property (nonatomic, strong) NSString *ID;

+ (instancetype)itemWithDict:(NSDictionary *)dict;

@end
