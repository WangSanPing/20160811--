//
//  WXDownMenu.m
//  20160811-彩票
//
//  Created by 王旭 on 16/8/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXDownMenu.h"
#import "WXMenuItem.h"

#define WXClos 3
#define WXItemWH WXScreenW / WXClos

@interface WXDownMenu ()

/** items */
@property (nonatomic,strong) NSArray *items;

/** btn */
@property (nonatomic,strong) NSMutableArray *btns;

@end

@implementation WXDownMenu

- (NSMutableArray *)btns{
    if(_btns == nil){
        _btns = [NSMutableArray array];
    }
    
    return _btns;
}

/**
 *  隐藏
 */
-(void)hide{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/**
 *  初始化
 *
 *  @param view  要展示到的view
 *  @param items 按钮数组
 *  @param oriY  Y值
 *
 *  @return view
 */
+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items oriY:(CGFloat)oriY{
    
    NSUInteger count = items.count;
    
    if(count % 3){
        NSException *excp = [NSException exceptionWithName:@"items的总数不符合" reason:@"传入的数组总数必须是3的倍数" userInfo:nil];
        [excp raise];
    }
    
    // 总行数
    NSUInteger rows = (count - 1) / WXClos + 1;
    CGFloat menuH = rows * WXItemWH;
    
    WXDownMenu *menu = [[WXDownMenu alloc] initWithFrame:CGRectMake(0, oriY, WXScreenW, menuH)];
    menu.items = items;
    
    // 添加按钮
    [menu setUpAllBtns];
    
    // 添加分割线
    [menu setUpAllDivideView];
    
    // 添加黑色的view
    UIView *black = [[UIView alloc] initWithFrame:menu.frame];
    black.backgroundColor = [UIColor blackColor];
    [superView addSubview:black];
    
    // 添加动画
    [menu setAnimWithMenu:menu superView:superView blackView:black];
    
    return menu;
}

#pragma mark - 动画
- (void)setAnimWithMenu:(WXDownMenu *)menu superView:(UIView *)superView blackView:(UIView *)black{
    menu.transform = CGAffineTransformMakeTranslation(0, -menu.height);
    
    [UIView animateWithDuration:0.5 delay:0
         usingSpringWithDamping:0.3 initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            menu.transform = CGAffineTransformIdentity;
                        } completion:^(BOOL finished) {
                            [black removeFromSuperview];
                        }];
    
    menu.backgroundColor = [UIColor blackColor];
    [superView addSubview:menu];
}

#pragma mark - 添加分割线
- (void)setUpAllDivideView
{
    for (int i = 0; i < WXClos - 1; i++) {
        UIView *divideV = [[UIView alloc] init];
        divideV.backgroundColor = [UIColor whiteColor];
        divideV.frame = CGRectMake((i + 1) * WXItemWH, 0, 1, self.height);
        
        [self addSubview:divideV];
    }
    
    NSUInteger rows = (self.items.count - 1) / WXClos + 1;
    
    for (int i = 0; i < rows - 1; i ++) {
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        divideV.frame = CGRectMake(0, (i + 1) * WXItemWH, self.width, 1);
        
        [self addSubview:divideV];
    }
}

#pragma mark - 添加所有按钮
/**
 *  添加按钮
 */
- (void)setUpAllBtns{
    for (WXMenuItem *item in self.items) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setImage:item.image forState:UIControlStateNormal];
        [self addSubview:btn];
        [self.btns addObject:btn];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSUInteger count = self.items.count;
    int col = 0;
    NSUInteger row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    
    for (NSInteger i = 0; i < count; i++) {
        col = i % WXClos;
        row = i / WXClos;
        
        UIButton *btn = self.btns[i];
        x = col * WXItemWH;
        y = row * WXItemWH;
        
        btn.frame = CGRectMake(x, y, WXItemWH, WXItemWH);
    }
}
@end






















































