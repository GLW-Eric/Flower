//
//  GLWEncyclopediaViewController.m
//  Flower
//
//  Created by glw on 16/5/1.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWEncyclopediaViewController.h"
//#import "GLWEncyclopediaModel.h"
#import <Masonry.h>
#import <MJExtension.h>
#import "GLWEncyclopediaModel.h"
#import "GLWEncyClassViewController.h"
@interface GLWEncyclopediaViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong) UITableView *tabelView;
@property(nonatomic,strong) NSMutableArray *dataArr;
@property(nonatomic,strong) NSMutableArray *closeArr;
@property(nonatomic,strong) NSArray *mainTitelArr;




@end

@implementation GLWEncyclopediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"百科";
    [self createUI];
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        _closeArr = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EncyclopediaList.plist" ofType:nil];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray *subClassArr = dic.allValues;
        _mainTitelArr = dic.allKeys;
        for (NSArray *array in subClassArr) {
            NSArray *arr = [GLWEncyclopediaModel mj_objectArrayWithKeyValuesArray:array];
            [_dataArr addObject:arr];
            [_closeArr addObject:[NSNumber numberWithBool:YES]];
        }
        
        
        
    }
    
    return _dataArr;
}




-(UITableView *)tabelView{
    if (!_tabelView) {
        _tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        _tabelView.separatorColor = [UIColor colorWithRed:22 / 255.0 green:18 / 255.0 blue:18 / 255.0 alpha:1.0];
        //_tabelView.backgroundColor = [UIColor colorWithRed:26 / 255.0 green:20 / 255.0 blue:20 / 255.0 alpha:1.0];
        _tabelView.backgroundColor = [[UIColor colorWithPatternImage:[UIImage imageNamed:@"encBack"]]colorWithAlphaComponent:0.3];
        _tabelView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
     
    }
    return _tabelView;
}

-(void)createUI{
    UIView *headerView = [[UIView alloc] init];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.leading.mas_equalTo(self.view);
        make.trailing.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    headerView.backgroundColor = [UIColor colorWithRed:91 / 255.0 green:70 / 255.0 blue:55 / 255.0 alpha:1.0];
    //headerView.alpha = 0.1;
    UILabel *mainTitleLabel = [[UILabel alloc] init];
    [headerView addSubview:mainTitleLabel];
    [mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.mas_equalTo(headerView.mas_top).offset(5);
        make.leading.mas_equalTo(headerView.mas_leading).offset(10);
        make.centerY.mas_equalTo(headerView);
    }];
    mainTitleLabel.text = @"百科分类";
    mainTitleLabel.textColor = [UIColor whiteColor];
    mainTitleLabel.font = [UIFont boldSystemFontOfSize:22.0];;
    
    [self.view addSubview:self.tabelView];
    [self.tabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.leading.mas_equalTo(self.view);
        make.trailing.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([_closeArr[section] boolValue]) {
        return 0;
    }
    return [self.dataArr[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
       
    }
    GLWEncyclopediaModel *model = self.dataArr[indexPath.section][indexPath.row];
    cell.textLabel.text = model.title;
    //cell.textLabel.textColor = [UIColor colorWithRed:91 / 255.0 green:70 / 255.0 blue:55 / 255.0 alpha:1.0];
    cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    cell.imageView.image = [UIImage imageNamed:@"left"];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
    UIView *headerView = [[UIView alloc] init];

    //headerView.backgroundColor = [UIColor colorWithRed:31 / 255.0 green:25 / 255.0 blue:25 / 255.0 alpha:0.3];
   
    UILabel *mainTitleLabel = [[UILabel alloc] init];
    [headerView addSubview:mainTitleLabel];
    [mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.mas_equalTo(headerView.mas_top).offset(5);
        make.leading.mas_equalTo(headerView.mas_leading).offset(10);
        make.centerY.mas_equalTo(headerView);
    }];
    
    mainTitleLabel.text = self.mainTitelArr[section];
    mainTitleLabel.textColor = [UIColor blackColor];
    mainTitleLabel.font = [UIFont boldSystemFontOfSize:20.0];
    
    UIImageView *rightImageView = [[UIImageView alloc] init];
    [headerView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(headerView).offset(-10);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
        make.centerY.mas_equalTo(headerView);
    }];
    
    if ([self.closeArr[section] boolValue]) {
        rightImageView.image = [UIImage imageNamed:@"rightClose"];
    }
    else{
        rightImageView.image = [UIImage imageNamed:@"rightOpen"];
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeOrOpen:)];
    headerView.tag = section;
    [headerView addGestureRecognizer:tap];
    
    return headerView;
}

-(void)closeOrOpen:(UITapGestureRecognizer *)tap{
    BOOL isClose = [[self.closeArr objectAtIndex:tap.view.tag] boolValue];
    //<2>将原有的状态取反：替换数组元素
    [self.closeArr replaceObjectAtIndex:tap.view.tag withObject:[NSNumber numberWithBool:!isClose]];
    //<3>刷新数据
    //    [_tableView reloadData];
    
    //NSIndexSet:数字的集合
    //只刷新对应的段的数据
    [self.tabelView reloadSections:[NSIndexSet indexSetWithIndex:tap.view.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GLWEncyclopediaModel *model = self.dataArr[indexPath.section][indexPath.row];
    GLWEncyClassViewController *class = [[GLWEncyClassViewController alloc] init];
    class.urlStr = [NSString stringWithFormat:@"http://www1.baike.com/api.php?datatype=json&m=article&a=list&category_id=%@&baike_id=8869&start=0&limit=10",model.ID];
    class.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:class animated:YES];
   
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
