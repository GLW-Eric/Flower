//
//  GLWBaseViewController.m
//  Flower
//
//  Created by glw on 16/5/1.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWBaseViewController.h"

@interface GLWBaseViewController ()

@end

@implementation GLWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
}

-(void)setNav{
    //[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    //[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    
    
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBack2"] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:201 / 255.0 green:222 / 255.0 blue:60/ 255.0 alpha:1.0];

    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:24 / 255.0 green:78 / 255.0 blue:31/ 255.0 alpha:1.0]}];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    searchBtn.frame = CGRectMake(0, 0, 35, 35);
    [searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *search = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = search;
//    self.navigationController.navigationBar setTitleTextAttributes:@{};
}


//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}

/*搜索待做*/
//-(void)searchClick:(UIButton *)seachBtn{
    
//}



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
