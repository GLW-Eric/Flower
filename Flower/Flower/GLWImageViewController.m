//
//  GLWImageViewController.m
//  Flower
//
//  Created by glw on 16/5/5.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWImageViewController.h"
#import "GLWImageModel.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "GLWShowWebViewController.h"
@interface GLWImageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) UICollectionView *collectonView;



@end

@implementation GLWImageViewController



-(NSArray *)dataArr{
    if (!_dataArr) {
        [GLWImageModel requestImageWithURLStr:@"http://m.zhongsou.com/srpnew/getwid?k=%E8%8A%B1%E5%8D%89&s=4a229669b8733a447ccb6ea3de074588&t=6&m=83f8f4e062f6a8145b4b26fb55def22d&p=1&sk=%E8%8A%B1%E5%8D%89&start=0&search_con=undefined" CallBack:^(NSArray *array, NSError *error) {
            _dataArr = array;
            [self.collectonView reloadData];
        }];
    }
    return _dataArr;
}

static NSString *imageCell = @"imageCell";
-(UICollectionView *)collectonView{
    if (!_collectonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectonView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectonView.delegate = self;
        _collectonView.dataSource = self;
        _collectonView.backgroundColor = [UIColor colorWithRed:70 /255.0 green:70 /255.0 blue:70 /255.0 alpha:1.0];
        [_collectonView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:imageCell];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 100, 10);
        CGFloat itemW = ([UIScreen mainScreen].bounds.size.width - 20) / 3;
        layout.itemSize = CGSizeMake(itemW - 7, itemW);
    }
    return _collectonView;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GLWImageModel *model = self.dataArr[indexPath.row];
    GLWShowWebViewController *show = [[GLWShowWebViewController alloc] init];
    show.URLStr = model.url;
    show.hidesBottomBarWhenPushed = YES;
    [self.mainHome.navigationController pushViewController:show animated:YES];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:imageCell forIndexPath:indexPath];
    
        GLWImageModel *model = self.dataArr[indexPath.item];
        UIImageView *imageView = [[UIImageView alloc] init];
       // imageView.frame = CGRectMake(0, 0, 20, 20);
        NSURL *url = [NSURL URLWithString:model.image];
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder_banner"]];
        [cell.contentView addSubview:imageView];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(cell.contentView);
                    make.leading.mas_equalTo(cell.contentView);
                    make.bottom.mas_equalTo(cell.contentView);
                    make.trailing.mas_equalTo(cell.contentView);
                }];
    

    //cell.contentView.backgroundColor = [UIColor greenColor];
        return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectonView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
