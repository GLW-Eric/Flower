//
//  GLWNewsController.m
//  Flower
//
//  Created by glw on 16/5/5.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWNewsController.h"
#import "GLWNewsModel.h"
#import "GLWNewsCell.h"
#import "GLWNewsSingelImageCell.h"
#import "GLWShowWebViewController.h"
@interface GLWNewsController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArr;


@end

@implementation GLWNewsController

-(NSArray *)dataArr{
    if (!_dataArr) {
        [GLWNewsModel requestNewsWithURLStr:@"http://m.zhongsou.com/srpnew/getwid?k=%E8%8A%B1%E5%8D%89&s=4a229669b8733a447ccb6ea3de074588&t=3&m=6f1298f3d17ab8b2b341af7da5e12d5d&p=1&sk=%E8%8A%B1%E5%8D%89&start=0&search_con=%26sc%3D0%26oi%3D0%26tm%3D0%26st%3D0%26p1%3D%26p2%3D" CallBack:^(NSArray *array, NSError *error) {
            _dataArr = array;
            [self.tabelView reloadData];
        }];
    }
    return _dataArr;
}

-(UITableView *)tabelView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GLWNewsCell class]) bundle:nil] forCellReuseIdentifier:@"GLWNewsCell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GLWNewsSingelImageCell class]) bundle:nil] forCellReuseIdentifier:@"GLWNewsSingelImageCell"];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.tabelView];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GLWNewsModel *model = self.dataArr[indexPath.row];
    if (model.pic_urls.count != 3 && model.picurl.length) {
      //  GLWNewsSingelImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GLWNewsSingelImageCell" forIndexPath:indexPath];
        GLWNewsSingelImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GLWNewsSingelImageCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"GLWNewsSingelImageCell" owner:nil options:nil]  lastObject];
        }
        cell.model = model;
        return cell;
    }
    
   // GLWNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GLWNewsCell" forIndexPath:indexPath];
    GLWNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GLWNewsCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GLWNewsCell" owner:nil options:nil] lastObject];
    }
    cell.model = model;
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GLWNewsModel *model = self.dataArr[indexPath.row];
    GLWShowWebViewController *show = [[GLWShowWebViewController alloc] init];
    show.URLStr = model.url;
    show.hidesBottomBarWhenPushed = YES;
    [self.mainHome.navigationController pushViewController:show animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GLWNewsModel *model = self.dataArr[indexPath.row];
    
    return model.cellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
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
