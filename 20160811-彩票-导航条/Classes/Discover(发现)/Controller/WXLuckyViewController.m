//
//  WXLuckyViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/1.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXLuckyViewController.h"

@interface WXLuckyViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *lightView;

@end

@implementation WXLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    
    _lightView.animationImages = @[image,image1];
    
    _lightView.animationDuration = 1;
    [_lightView startAnimating];
}

@end
