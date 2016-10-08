//
//  WXHelpViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/10/4.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXHelpViewController.h"

#import "WXHtmlItem.h"
#import "WXHtmlViewController.h"
#import "WXNavigationController.h"


@interface WXHelpViewController ()<UITableViewDelegate>

/** htmls */
@property (nonatomic, strong) NSMutableArray *htmls;

@end

@implementation WXHelpViewController

- (NSMutableArray *)htmls{
    
    if(_htmls == nil){
        _htmls = [NSMutableArray array];
        
        // 拿到json文件
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *dict in dictArr) {
            WXHtmlItem *item = [WXHtmlItem itemWithDict:dict];
            
            [_htmls addObject:item];
        }
    }
    
    return _htmls;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup];
}

- (void)setUpGroup
{
    [self htmls];
}


#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _htmls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] init];
    }
    
    WXHtmlItem *item = _htmls[indexPath.row];
    
    cell.textLabel.text = item.title;
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //    vc.view = [[UIView alloc] initWithFrame:WXScreenBounds];
    //    vc.view.backgroundColor = [UIColor redColor];
    //    WXNavigationController *vcc = [[WXNavigationController alloc] init];
    //    [self.navigationController pushViewController:vc animated:YES];
    
    
    WXHtmlViewController *vc = [[WXHtmlViewController alloc] init];
    vc.htmlItem = _htmls[indexPath.row];
    vc.title = vc.htmlItem.title;
    
    WXNavigationController *nav = [[WXNavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end























