//
//  GLWImageScrollHearderView.m
//  WuKongTV
//
//  Created by MS on 16-4-21.
//  Copyright (c) 2016年 ms. All rights reserved.
//

#import "GLWImageScrollHearderView.h"
#import "GLWScrollModel.h"
#import <SDCycleScrollView.h>
#import "GLWHeader.h"
#import "GLWShowWebViewController.h"

@interface GLWImageScrollHearderView ()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView *imageScrollView;
@property (nonatomic,strong) __block NSArray *dataArr;
@end
@implementation GLWImageScrollHearderView
//初始化滚动数据源
-(NSArray *)dataArr{
    if (!_dataArr) {
        
        [GLWScrollModel requestScrollWithCallBack:^(NSArray *array, NSError *error) {
            _dataArr = array;
            [self setImageScroll];
            
        }];
    }
    
    return _dataArr;
}

+(instancetype)hearderViewForCollectionView:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath{
    GLWImageScrollHearderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ImageScroll" forIndexPath:indexPath];
    if (!header) {
        header = [[GLWImageScrollHearderView alloc] initWithFrame:CGRectMake(0, 0, GLWScreenW, GLWScreenH * 0.25)];
    }
    return header;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self dataArr];
        
        
    }
    return self;
}

-(void)setImageScroll{

    NSMutableArray *urlStrArr = [NSMutableArray array];
    NSMutableArray *titelArr = [NSMutableArray array];
    for (GLWScrollModel *model in _dataArr) {
        [urlStrArr addObject:model.pic_url];
        [titelArr addObject:model.desc];
    }
    SDCycleScrollView * imageScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, GLWScreenW, GLWScreenH * 0.25) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder_banner"]];
    [imageScrollView setImageURLStringsGroup:urlStrArr];
    [imageScrollView setTitlesGroup:titelArr];
    
    imageScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    imageScrollView.autoScrollTimeInterval = 3;
    self.imageScrollView = imageScrollView;
    [self addSubview:imageScrollView];

}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    GLWScrollModel *model = self.dataArr[index];
    GLWShowWebViewController *show = [[GLWShowWebViewController alloc] init];
    show.URLStr = model.source_url;
    show.hidesBottomBarWhenPushed = YES;
    [self.VC.navigationController pushViewController:show animated:YES];
}

@end
