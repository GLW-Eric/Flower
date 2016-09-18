//
//  GLWImageScrollHearderView.h
//  WuKongTV
//
//  Created by MS on 16-4-21.
//  Copyright (c) 2016年 ms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLWImageScrollHearderView : UICollectionReusableView
@property (nonatomic,strong) UIViewController *VC;
+(instancetype)hearderViewForCollectionView:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath;
@end
