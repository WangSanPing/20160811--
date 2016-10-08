//
//  WXHtmlItem.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/10/4.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXHtmlItem.h"


@implementation WXHtmlItem

+ (instancetype)itemWithDict:(NSDictionary *)dict{
    WXHtmlItem *item = [WXHtmlItem objcWithDict:dict mapDict:@{@"ID":@"id"}];
    
    // 根据字典的key转换为
//    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//
//    if([key isEqualToString:@"id"]){
//        [self setValue:value forKey:@"ID"];
//    }else{
//        [super setValue:value forKey:key];
//    }
//}
@end
