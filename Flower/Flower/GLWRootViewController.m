//
//  GLWRootViewController.m
//  Flower
//
//  Created by glw on 16/5/1.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWRootViewController.h"
#import "GLWHomeViewController.h"
#import "GLWEncyclopediaViewController.h"
#import "GLWMineViewController.h"
#import "AppDelegate.h"
@interface GLWRootViewController ()

@end

@implementation GLWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goMainView];
//设置程序推送提示
//    UIApplication *app = [UIApplication sharedApplication];
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
//    [app registerUserNotificationSettings:settings];
//    app.applicationIconBadgeNumber = 0;
    
}


-(void)goMainView{
    GLWHomeViewController *home = [[GLWHomeViewController alloc] init];
    GLWEncyclopediaViewController *encyclopedia = [[GLWEncyclopediaViewController alloc] init];
    GLWMineViewController *mine = [[GLWMineViewController alloc] init];
    NSArray *vcArr = @[home,encyclopedia,mine];
    NSArray *imageArr = @[@"home",@"encyclopedia",@"myinfo"];
    //NSArray *imageArr = @[@"home1",@"book",@"my"];
    NSArray *titelArr = @[@"首页",@"百科",@"个人信息"];
    UITabBarController *tab = [[UITabBarController alloc] init];
    //tab.tabBar.backgroundImage = [UIImage imageNamed:@"home_on"];
    
    [tab.tabBar setBackgroundImage:[[UIImage alloc] init]];
    [tab.tabBar setShadowImage:[[UIImage alloc]init]];
    
    tab.tabBar.backgroundColor = [UIColor colorWithRed:24 / 255.0 green:78 / 255.0 blue:78/ 255.0 alpha:1.0];
    //[tab.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBack1"]];
    tab.tabBar.tintColor = [UIColor yellowColor];
    
   
    
    for (int i = 0 ; i < vcArr.count; i ++) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vcArr[i]];
        [tab addChildViewController:nav];
        UIImage *image = [[UIImage imageNamed:imageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage = [UIImage imageNamed:[imageArr[i] stringByAppendingString:@"_on"]];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:titelArr[i] image:image selectedImage:selectImage];
        
        nav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        
        
    }
    AppDelegate *appD = [UIApplication sharedApplication].delegate;
    appD.window.rootViewController = tab;
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
