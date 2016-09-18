//
//  GLWSubHomeController.m
//  Flower
//
//  Created by glw on 16/5/4.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWSubHomeController.h"
#import "GLWImageScrollHearderView.h"
#import "GLWHeader.h"
#import "GLWSubHomeCell.h"
#import "GLWSubHomeModel.h"
#import "GLWShowWebViewController.h"
@interface GLWSubHomeController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) GLWImageScrollHearderView *imageScroll;


@end


@implementation GLWSubHomeController
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //_tableView.backgroundColor = [UIColor grayColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GLWSubHomeCell class]) bundle:nil] forCellReuseIdentifier:@"SubHomeCell"];
    }
    return _tableView;
}

-(GLWImageScrollHearderView *)imageScroll{
    if (!_imageScroll) {
        _imageScroll = [[GLWImageScrollHearderView alloc] initWithFrame:CGRectMake(0, 0, GLWScreenW, GLWScreenH * 0.25)];
        _imageScroll.VC = self.mainHome;
    }
    return _imageScroll;
}

-(NSArray *)dataArr{
    if (!_dataArr) {
        [GLWSubHomeModel requestNewArtWithURLStr:@"http://www1.baike.com/api.php?datatype=json&m=article&a=new&baike_id=8869&start=0&limit=10" CallBack:^(NSArray *array, NSError *error) {
            _dataArr = array;
            [self.tableView reloadData];
        }];
        
    }
    return _dataArr;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GLWSubHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubHomeCell" forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GLWSubHomeModel *model = self.dataArr[indexPath.row];
    GLWShowWebViewController *show = [[GLWShowWebViewController alloc] initWithNibName:NSStringFromClass([GLWShowWebViewController class]) bundle:nil];
//    GLWShowWebViewController *show = [[GLWShowWebViewController alloc] init];
    show.URLStr = [@"http://www1.baike.com/api.php?m=article&a=view2&baike_id=8869&article_id=" stringByAppendingString:model.ID];
    show.hidesBottomBarWhenPushed = YES;
    [self.mainHome.navigationController pushViewController:show animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.imageScroll;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return GLWScreenH * 0.25;
}

@end
