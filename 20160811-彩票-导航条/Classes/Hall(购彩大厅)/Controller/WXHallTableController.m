//
//  WXHallTableController.m
//  20180811-彩票
//
//  Created by 王旭 on 16/8/12.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXHallTableController.h"

#import "WXCover.h"
#import "WXActiveMenu.h"
#import "WXDownMenu.h"
#import "WXMenuItem.h"


@interface WXHallTableController ()<WXActiveMenuDelegate>

/** downMenu */
@property (nonatomic,weak) WXDownMenu *downMenu;

/** isPopMenu */
@property (nonatomic,assign) BOOL isPopMenu;

@end

@implementation WXHallTableController

-(WXDownMenu *)downMenu{
    if(_downMenu == nil){
        WXMenuItem *item = [WXMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        WXMenuItem *item1 = [WXMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        WXMenuItem *item2 = [WXMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        WXMenuItem *item3 = [WXMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        WXMenuItem *item4 = [WXMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        WXMenuItem *item5 = [WXMenuItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        
        NSArray *items = @[item,item1,item2,item3,item4,item5];
        
        _downMenu = [WXDownMenu showInView:self.view items:items oriY:0];
    }
    
    return _downMenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriRenderingImage:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(active)];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriRenderingImage:@"Development"]  style:UIBarButtonItemStylePlain target:self action:@selector(popMenu)];
}

#pragma mark - 点击菜单按钮的时候调用
- (void)popMenu{
    if(_isPopMenu == NO){
        [self downMenu];
    }else{
        [self.downMenu hide];
    }
    
    _isPopMenu = !_isPopMenu;
}

#pragma mark - 点击活动
- (void)active
{
//    NSLog(@"点击活动");
    
    // 弹出蒙版
    [WXCover show];
    
    WXActiveMenu *menu = [WXActiveMenu showInPoint:self.view.center];
    menu.delegate = self;
    
}

#pragma mark -activeMenu的代理方法
- (void)activeMenuDidClickBtn:(WXActiveMenu *)menu{
    [WXActiveMenu hideInPoint:CGPointMake(44, 44) completion:^{
        [WXCover hide];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
