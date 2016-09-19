//
//  WXNavigationController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/18.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXNavigationController.h"


/**
 系统自带的滑动手势需要实现的代理
 @interface WXNavigationController()<UINavigationControllerDelegate>
 */

/**
 自定义滑动返回
 */
@interface WXNavigationController()<UIGestureRecognizerDelegate>

/** delegate */
@property (nonatomic, strong) id popDelegate;

@end

@implementation WXNavigationController


// 当前类或者他的子类第一次使用的时候才会调用
+ (void)initialize
{
    // 获取当前类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条返回按钮文字颜色
    [bar setTintColor:[UIColor whiteColor]];
    
    // 设置导航条标题颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    [bar setTitleTextAttributes:titleAttr];
}

- (void)viewDidLoad{
    [super viewDidLoad];
        
//    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
//    
//    self.delegate = self;
    /*
     自定义滑动返回。可覆盖全部界面
     核心思想为重新定义系统所用的返回手势UIPanGestureRecognizer,把target改为当前的界面的手势代理，然后实现代理方法。
     */
    
    NSArray *targets = [self.interactivePopGestureRecognizer valueForKeyPath:@"_targets"];
    
    id objc = [targets firstObject];
//    id target = [objc valueForKeyPath:@"_target"];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
}

#pragma mark - 导航控制器的代理方法

/**
 是否允许滑动

 @param gestureRecognizer 手势
 @return 是否允许滑动
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return (self.topViewController != [self.viewControllers firstObject]);
}

//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    // 如果导航控制器是根控制器，就还原pop手势代理
//    if(viewController == [self.viewControllers firstObject]){
//        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
//    }
//}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
        
    // viewControllers非0时为非根控制器
    if(self.viewControllers.count != 0){
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
        // 因为在使用自定义的leftBarButtonItem时会对自带的右滑动返回功能有影响，去掉自带的手势代理后恢复正常
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end






























