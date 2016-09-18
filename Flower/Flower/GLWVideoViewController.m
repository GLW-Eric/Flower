//
//  GLWVideoViewController.m
//  Flower
//
//  Created by glw on 16/5/5.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWVideoViewController.h"
#import "GLWVideoModel.h"
#import "GLWVideoCell.h"
#import "GLWShowWebViewController.h"
@interface GLWVideoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArr;
@end

@implementation GLWVideoViewController

-(NSArray *)dataArr{
    if (!_dataArr) {
        [GLWVideoModel requestVideoWithURLStr:@"http://m.zhongsou.com/srpnew/getwid?k=%E8%8A%B1%E5%8D%89&s=4a229669b8733a447ccb6ea3de074588&t=7&m=59a14d396e28fff54202027269e28f2b&p=1&sk=%E8%8A%B1%E5%8D%89&start=0&search_con=undefined" CallBack:^(NSArray *array, NSError *error) {
            _dataArr = array;
            [self.tableView reloadData];
        }];
    }
    return _dataArr;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GLWVideoCell class]) bundle:nil] forCellReuseIdentifier:@"GLWVideoCell"];
        
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    GLWVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GLWVideoCell" forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GLWVideoModel *model = self.dataArr[indexPath.row];
    GLWShowWebViewController *show = [[GLWShowWebViewController alloc] init];
    show.URLStr = model.url;
    show.hidesBottomBarWhenPushed = YES;
    [self.mainHome.navigationController pushViewController:show animated:YES];
    
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
