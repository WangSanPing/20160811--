//
//  WXTabBarController.m
//  20180811-彩票
//
//  Created by 王旭 on 16/8/12.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXTabBarController.h"

#import "WXTabBar.h"
#import "WXHallTableController.h"
#import "WXArenaTableController.h"
#import "WXHistoryTableController.h"
#import "WXDiscoverTableController.h"
#import "WXMyLotteryViewController.h"



@interface WXTabBarController ()

/** 保存所有控制器对应的按钮的内容 */
@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation WXTabBarController

- (NSMutableArray *)items{
    
    if(_items == nil){
        _items = [NSMutableArray array];
    }
    
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setUpAllChildViewController];
    
    // 自定义tabBar
    [self setUpTabBar];
}

#pragma mark - 自定义tabBar
- (void)setUpTabBar{
    // 移除系统的tabBar，相当于把tabBar上所有的按钮移除
    // 把一个控件移除父控件并不会马上销毁，什么时候销毁，一般在下一次运行循环的时候，就会判断这个对象有没有强引用，如果没有，才会销毁。
    [self.tabBar removeFromSuperview];
    
    WXTabBar *tabBar = [[WXTabBar alloc] init];
    tabBar.items = self.items;
    tabBar.backgroundColor = [UIColor orangeColor];
    tabBar.frame = self.tabBar.frame;
    [self.view addSubview:tabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 添加所有子控制器

// tabBar上面按钮的图片尺寸是由规定，不能超过44
- (void)setUpAllChildViewController
{
    // 购彩大厅
    WXHallTableController *hall = [[WXHallTableController alloc] init];
    
    [self setUpOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"]];
    
    // 竞技场
    WXArenaTableController *arena = [[WXArenaTableController alloc] init];
    
    [self setUpOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]];
    
    // 发现
    WXDiscoverTableController *discover = [[WXDiscoverTableController alloc] init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]];
    
    // 开奖信息
    WXHistoryTableController *history = [[WXHistoryTableController alloc] init];
    [self setUpOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"]];
    
    // 我的彩票
    WXMyLotteryViewController *myLottery = [[WXMyLotteryViewController alloc] init];
    [self setUpOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]];
}

#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage{
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    [self.items addObject:vc.tabBarItem];
    vc.view.backgroundColor = [self randomColor];
    [self addChildViewController:vc];
}

- (UIColor *)randomColor
{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
