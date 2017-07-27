//
//  ESWebViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/17.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESWebViewController.h"

@interface ESWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ESWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载本地HTML没有用
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"about_us_link.html"
                                                          ofType:nil];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    
    
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];

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
