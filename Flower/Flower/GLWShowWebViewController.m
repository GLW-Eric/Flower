//
//  GLWShowWebViewController.m
//  Flower
//
//  Created by glw on 16/5/8.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWShowWebViewController.h"

@interface GLWShowWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *showWeb;
@property (weak, nonatomic) IBOutlet UIToolbar *showToolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousBtn;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshBtn;

@end

@implementation GLWShowWebViewController
- (IBAction)previosClick:(UIBarButtonItem *)sender {
    [self.showWeb goBack];
}
- (IBAction)nextClick:(UIBarButtonItem *)sender {
    [self.showWeb goForward];
}
- (IBAction)refreshClick:(UIBarButtonItem *)sender {
    [self.showWeb reload];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.showWeb.delegate = self;
    self.showWeb.scalesPageToFit = YES;
    [self.showWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URLStr]]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    self.previousBtn.enabled = self.showWeb.canGoBack;
    self.nextBtn.enabled = self.showWeb.canGoForward;
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
