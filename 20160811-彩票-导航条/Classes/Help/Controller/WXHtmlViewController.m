//
//  WXHtmlViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 2016/10/8.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXHtmlViewController.h"

@interface WXHtmlViewController ()<UIWebViewDelegate>

@end

@implementation WXHtmlViewController

- (void)loadView{
    //    [super loadView];
    self.view = [[UIWebView alloc] initWithFrame:WXScreenBounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(dismiss)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = (UIWebView *)self.view;
    
    // 两种加载URL的方式
    
    
    //第一种
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:_htmlItem.html ofType:nil];
    //    // 如果路径有中文，必须转换成百分号，编码为UTF-8
    //    // 转换百分号的方法↓↓↓
    //    filePath = [filePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSURL *url = [NSURL URLWithString:filePath];
    
    // 第二种
    NSURL *url = [[NSBundle mainBundle] URLForResource:_htmlItem.html withExtension:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    webView.delegate = self;
    
}

// 执行JavaScript，必须要在webView加载完成时执行
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *javaStr = [NSString stringWithFormat:@"window.location.href = '#%@';",_htmlItem.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:javaStr];
}

- (void)dismiss{
    // 跳转回原有控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
