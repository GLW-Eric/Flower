//
//  GLWEncyClassViewController.m
//  Flower
//
//  Created by glw on 16/5/8.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWEncyClassViewController.h"
#import "GLWEncyClassModel.h"
#import "GLWEncyViewCell.h"
#import "GLWShowWebViewController.h"
@interface GLWEncyClassViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) UICollectionView *collectonView;

@end

@implementation GLWEncyClassViewController

-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray array];
        [GLWEncyClassModel requestEncyWithURLStr:self.urlStr CallBack:^(NSArray *array, NSError *error) {
            _dataArr = array;
            [self.collectonView reloadData];
        }];
    }
    return _dataArr;
}

-(UICollectionView *)collectonView{
    if (!_collectonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]  init];
        
        _collectonView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectonView.delegate = self;
        _collectonView.dataSource = self;
        _collectonView.backgroundColor = [UIColor colorWithRed:70 /255.0 green:70 /255.0 blue:70 /255.0 alpha:1.0];
        [_collectonView registerNib:[UINib nibWithNibName:NSStringFromClass([GLWEncyViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"GLWEncyViewCell"];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 100, 10);
        CGFloat itemW = ([UIScreen mainScreen].bounds.size.width - 20) / 2;
        layout.itemSize = CGSizeMake(itemW - 7, itemW);
    }
    return _collectonView;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GLWEncyViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLWEncyViewCell" forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.item];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GLWEncyClassModel *model = self.dataArr[indexPath.row];
    GLWShowWebViewController *show = [[GLWShowWebViewController alloc] init];
    show.URLStr = [@"http://www1.baike.com/api.php?m=article&a=view2&baike_id=8869&article_id=" stringByAppendingString:model.ID];
    show.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:show animated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // NSLog(@"%@",self.urlStr);
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
