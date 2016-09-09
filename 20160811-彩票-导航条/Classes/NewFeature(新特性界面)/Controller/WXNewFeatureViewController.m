//
//  WXNewFeatureViewController.m
//  20160811-彩票
//
//  Created by 王旭 on 16/9/8.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXNewFeatureViewController.h"
#import "WXNewFeatureCell.h"
#define WXPages 4

@interface WXNewFeatureViewController ()

@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *guideView;

/** guideLargetView */
@property (nonatomic, weak) UIImageView *guideLargetView;

@property (nonatomic, weak) UIImageView *guideSmallView;

@end

/**
 *  注意点
 1、UICollectionViewController 层次结构：控制器View 上面UICollectionView
 2、self.view != self.collectionView
 3、初始化的时候必须设置布局参数，通常使用系统提供的流水布局UICollectionViewFlowLayout
 4、cell必须通过注册
 5、自定义cell
 */
@implementation WXNewFeatureViewController

// 注册cell
static NSString * const reuseIdentifier = @"Cell";


- (instancetype)init{
    // 设置布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置cell的尺寸
    layout.itemSize = WXScreenBounds.size;
    
    // 设置cell之间的间距
    layout.minimumInteritemSpacing = 0;
    
    // 设置行距
    layout.minimumLineSpacing = 0;
    
    //设置每一组的内间距
    //    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    return [super initWithCollectionViewLayout:layout];
}

#pragma mark - 返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - 返回每组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return WXPages;
    
}

#pragma mark - 返回每个cell的样子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WXNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setUpIndexPath:indexPath count:WXPages];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    
    // Register cell classes
    [self.collectionView registerClass:[WXNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setUpAllChildView];
    
}

- (void)setUpAllChildView{
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    _guideView = guide;
    guide.centerX = self.view.centerX;
    
    [self.collectionView addSubview:guide];
    
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 160;
    [self.collectionView addSubview:guideLine];
    
    // largerText
    UIImageView *largerText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largerText.centerX = self.view.centerX;
    largerText.centerY = self.view.height * 0.7;
    _guideLargetView = largerText;
    [self.collectionView addSubview:largerText];
    
    // smallText
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    _guideSmallView = smallText;
    smallText.centerX = self.view.centerX;
    smallText.centerY = self.view.height * 0.8;
    [self.collectionView addSubview:smallText];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 获取当前x偏移量
    CGFloat curOffsetX = scrollView.contentOffset.x;
    
    // 获取差值
    CGFloat delta = curOffsetX - _lastOffsetX;
    
    _guideView.x += 2 * delta;
    _guideLargetView.x += 2 * delta;
    _guideSmallView.x +=  2 * delta;
    
    [UIView animateWithDuration:0.5 animations:^{
        _guideView.x -=  delta;
        _guideLargetView.x -= delta;
        _guideSmallView.x -=   delta;
    }];
    
    int page = curOffsetX / self.view.width + 1;
    
    _guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    _lastOffsetX = curOffsetX;
}

@end


































