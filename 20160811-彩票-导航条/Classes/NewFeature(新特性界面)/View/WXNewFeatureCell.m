//
//  WXNewFeatureCell.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/9.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXNewFeatureCell.h"
#import "WXTabBarController.h"

@interface WXNewFeatureCell()

/** imageView */
@property (nonatomic, weak) UIImageView *imageView;

/** btn */
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation WXNewFeatureCell

-(UIButton *)startButton
{
    if(_startButton == nil){
        
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [_startButton sizeToFit];
        
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startButton.center = CGPointMake(self.width * 0.5, self.height * 0.9);
        
        [self.contentView addSubview:_startButton];
    }
    
    return _startButton;
}

- (UIImageView *)imageView
{
    if(_imageView == nil){
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _imageView = imageV;
        
        [self.contentView addSubview:imageV];
    }
    
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

- (void)setUpIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount
{
    if(indexPath.row == pagesCount - 1){
        self.startButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
    }
}

- (void)start
{
    WXKeyWindow.rootViewController = [[WXTabBarController alloc] init];
    
    CATransition *anim = [CATransition animation];
    
    anim.duration = 0.5;
    anim.type = @"rippleffect";
    [WXKeyWindow.layer addAnimation:anim forKey:nil];
}
@end






























