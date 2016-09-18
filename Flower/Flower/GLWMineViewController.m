//
//  GLWMineViewController.m
//  Flower
//
//  Created by glw on 16/5/1.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWMineViewController.h"
#import "GLWLoginController.h"
#import "GLWRegisterController.h"
#import <Masonry.h>

@interface GLWMineViewController ()
{
    NSTimer * _timer;
}
@property(nonatomic,strong) UIImageView *backImageView;



@end

@implementation GLWMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人信息";
    [self createUI];
}

-(void)createUI{
    UIImageView *backImageView = [[UIImageView alloc] init];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view).multipliedBy(2.0);
        make.center.mas_equalTo(self.view);
    }];
    
    self.backImageView = backImageView;
    
    self.backImageView.image = [UIImage imageNamed:@"backg1"];
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timeGo) userInfo:nil repeats:YES];
    UIImageView *logoImageView = [[UIImageView alloc] init];
    [self.view addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(80);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70);
    }];
    logoImageView.image = [UIImage imageNamed:@"logo"];
    
    UIImageView *titleImageView = [[UIImageView alloc] init];
    [self.view addSubview:titleImageView];
    [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(logoImageView.mas_bottom).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    titleImageView.image = [UIImage imageNamed:@"word"];
    titleImageView.backgroundColor = [UIColor clearColor];
//    titleLabel.text = @"花若盛开  蝴蝶自来";
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    //titleLabel.font = [UIFont fontWithName:@"BodoniSvtyTwoOSITCTT-BookIt" size:15.0];
    
//    NSArray *fontFamily = [UIFont familyNames];
//    for (NSString *names in fontFamily) {
//        NSArray *name = [UIFont fontNamesForFamilyName:names];
//        for (NSString *font in name) {
//            NSLog(@"%@",font);
//        }
//    }
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(titleImageView.mas_bottom).offset(50);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(40);
    }];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"green"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:registBtn];
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(20);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(40);
    }];
    [registBtn setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(registClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)loginClick:(UIButton *)button{
    GLWLoginController *loginVC = [[GLWLoginController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
    loginVC.hidesBottomBarWhenPushed = YES;
}


-(void)registClick:(UIButton *)button{
    GLWRegisterController *registVC = [[GLWRegisterController alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
    registVC.hidesBottomBarWhenPushed = YES;
}


-(void)timeGo{
    self.backImageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    NSMutableArray *imageArr = [NSMutableArray array];
    static int index = 1;
    for (int i = 0; i < 3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"backg%d",i + 1]];
        [imageArr addObject:image];
    }
    index ++;
    if (index == 3) {
        index = 0;
    }
    self.backImageView.image = imageArr[index];
    
    [UIView animateWithDuration:5 animations:^{
        
        self.backImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        
    }];
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
