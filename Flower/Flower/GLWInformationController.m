//
//  GLWInformationController.m
//  Flower
//
//  Created by glw on 16/5/9.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWInformationController.h"
#import "GLWInformationModel.h"
#import <Masonry.h>
#import <MJExtension.h>
@interface GLWInformationController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tabelView;
@property(nonatomic,strong) NSArray *dataArr;


@end

@implementation GLWInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self tabelView];
    GLWInformationModel *model = self.dataArr[0];
    self.title = model.information;
}

-(UITableView *)tabelView{
    if (!_tabelView) {
        _tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        [self.view addSubview:self.tabelView];
        [self.tabelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.view);
            make.center.mas_equalTo(self.view);
        }];
//        _tabelView.contentOffset = CGPointMake(0, -40);
    
    }
    return _tabelView;
}

-(NSArray *)dataArr{
    if (!_dataArr) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"GLWInformationList.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        _dataArr = [GLWInformationModel mj_objectArrayWithKeyValuesArray:arr];
        
    }
    return _dataArr;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *iden = @"information";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:iden];
    }
    GLWInformationModel *model = self.dataArr[indexPath.row];
    
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.information;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [[UIView alloc] init];

    UIImageView *backImage = [[UIImageView alloc] init];
    [backView addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(backView);
        make.center.mas_equalTo(backView);
    }];
    
    
    backImage.image = [UIImage imageNamed:@"hearder"];
    UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headerBtn.layer.cornerRadius = 30;
    headerBtn.clipsToBounds = YES;
    [headerBtn setImage:[UIImage imageNamed:@"userHeader"] forState:UIControlStateNormal];
    [headerBtn setImageEdgeInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    [backView addSubview:headerBtn];
    [headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView);
        make.bottom.mas_equalTo(backView).offset(-20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    [headerBtn setBackgroundImage:[[UIImage alloc]init] forState:UIControlStateNormal];
    [headerBtn setBackgroundColor:[UIColor colorWithRed:160 / 255.0 green:234 / 255.0 blue:234 / 255.0 alpha:0.7]];
    backImage.userInteractionEnabled = YES;
    backImage.alpha = 0.7;
    return backView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
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
