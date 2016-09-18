//
//  GLWLoginController.m
//  Flower
//
//  Created by glw on 16/5/9.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWLoginController.h"
#import "GLWInformationController.h"
@interface GLWLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation GLWLoginController
- (IBAction)loginBtn:(UIButton *)sender {
    GLWInformationController *informationVC = [[GLWInformationController alloc] init];
    [self.navigationController pushViewController:informationVC animated:YES];
    informationVC.hidesBottomBarWhenPushed = YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.userTextField resignFirstResponder];
    [self.passWdTextField resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登陆";
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
