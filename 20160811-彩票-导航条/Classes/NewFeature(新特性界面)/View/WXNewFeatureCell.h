//
//  WXNewFeatureCell.h
//  20160811-彩票
//
//  Created by 王旭 on 16/9/9.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXNewFeatureCell : UICollectionViewCell

/** image */
@property (nonatomic, strong) UIImage *image;

- (void)setUpIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount;
@end
