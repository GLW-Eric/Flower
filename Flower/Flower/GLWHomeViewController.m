//
//  GLWHomeViewController.m
//  Flower
//
//  Created by glw on 16/5/1.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWHomeViewController.h"
#import <Masonry.h>
#import "GLWHeader.h"
#import "GLWSubHomeController.h"
#import "GLWNewsController.h"
#import "GLWVideoViewController.h"
#import "GLWImageViewController.h"
@interface GLWHomeViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate,UIScrollViewDelegate>
/**
 头菜单滚动视图
 */
@property(nonatomic,strong) UIScrollView *hearderMeau;

/**
 页面视图控制器
 */
@property(nonatomic,strong) UIPageViewController *pageVC;
/**
 保存按钮
 */
@property(nonatomic,strong) NSMutableArray *btnArr;
/**
 保存控制器
 */
@property(nonatomic,strong) NSArray *vcArr;

/**
 按钮选中标记View
 */
@property(nonatomic,strong)  UIView *markView;

/**
 记录将要翻到的页数
 */
@property(nonatomic,assign) NSInteger willIndex;



@end

@implementation GLWHomeViewController

//菜单栏
-(UIScrollView *)hearderMeau{
    if (!_hearderMeau) {
        _hearderMeau = [[UIScrollView alloc] init];
        [self.view addSubview:_hearderMeau];
        [_hearderMeau mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view);
            make.leading.mas_equalTo(self.view);
            make.trailing.mas_equalTo(self.view);
            make.height.mas_equalTo(30);
        }];
        
       // _hearderMeau.backgroundColor = [UIColor colorWithRed:70 / 255.0 green:70 / 255.0 blue:70 / 255.0 alpha:0.3];
        _hearderMeau.backgroundColor = [UIColor colorWithRed:24 / 255.0 green:78 / 255.0 blue:31 / 255.0 alpha:0.5];
    }
    return _hearderMeau;
}

//菜单按钮数组
-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
        NSArray *titleArr = @[@"首页",@"新闻动态",@"相关视频",@"图片欣赏"];
        for (NSInteger i = 0; i < 4; i++) {
            
            CGFloat btnW = (GLWScreenW - 10) * 0.25;
            CGFloat btnH = 27;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * (btnW + 2) + 2, 0, btnW, btnH);
            //[button setTitleColor:[UIColor colorWithRed:24 / 255.0 green:78 / 255.0 blue:31/ 255.0 alpha:1.0] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
           // button.adjustsImageWhenHighlighted = NO;
            [button addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
            [self.hearderMeau addSubview:button];
            //button.tag = i + 10;
            [_btnArr addObject:button];
            
            if (i == 0) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, btnH, btnW, 3)];
                view.backgroundColor = [UIColor yellowColor];
                self.markView = view;
                [self.hearderMeau addSubview:self.markView];
                button.selected = YES;
            }
            
        }
    }
    return _btnArr;
    
}

-(NSArray *)vcArr{
    if (!_vcArr) {
        
        GLWSubHomeController *subHomeVC = [[GLWSubHomeController alloc] init];
        GLWNewsController *newsVC = [[GLWNewsController alloc] init];
        GLWVideoViewController *vidioVC = [[GLWVideoViewController alloc] init];
        GLWImageViewController *imageVC = [[GLWImageViewController alloc] init];
        subHomeVC.mainHome = self;
        newsVC.mainHome = self;
        vidioVC.mainHome = self;
        imageVC.mainHome = self;
        _vcArr = @[subHomeVC,newsVC,vidioVC,imageVC];
    }
    return _vcArr;
}


//切换页面的button点击事件
-(void)changeVC:(UIButton *)button{
    for (UIButton *btn in self.btnArr) {
        btn.selected = NO;
    }
    button.selected = YES;
    NSInteger index = [self.btnArr indexOfObject:button];
    self.markView.frame = CGRectMake(button.frame.origin.x, self.markView.frame.origin.y, self.markView.frame.size.width, self.markView.frame.size.height);
    [self.pageVC setViewControllers:@[self.vcArr[index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

//pageVeiwController
-(UIPageViewController *)pageVC{
    if (!_pageVC) {
        _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [self.view addSubview:_pageVC.view];
        [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.hearderMeau.mas_bottom);
            make.leading.mas_equalTo(self.view);
            make.trailing.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view);
        }];
        _pageVC.delegate = self;
        _pageVC.dataSource = self;
    }
    return _pageVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    [self btnArr];
    
    
    [self.pageVC setViewControllers:@[self.vcArr[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [self.vcArr indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return self.vcArr[index - 1];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [self.vcArr indexOfObject:viewController];
    if (index == self.vcArr.count - 1) {
        return nil;
    }
    return self.vcArr[index + 1];
}

-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    
    self.willIndex = [self.vcArr indexOfObject:pendingViewControllers[0]];
    
     
}
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed) {
        for (UIButton *btn in self.btnArr) {
            btn.selected = NO;
            
        }
        
        UIButton *btn = self.btnArr[self.willIndex];
        btn.selected = YES;
        self.markView.frame = CGRectMake(btn.frame.origin.x, self.markView.frame.origin.y, self.markView.frame.size.width, self.markView.frame.size.height);
        
    }
    
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
