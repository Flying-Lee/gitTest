//
//  ESPersonDetailViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/14.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESPersonDetailViewController.h"
#import "UIBarButtonItem+LPFExtension.h"

@interface ESPersonDetailViewController ()

@end

@implementation ESPersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self setUpNav];
}

- (void)setUpUI {
    
    self.portraitImageView.image = [UIImage imageNamed:@"default_portrait_msg"];
    self.portraitImageView.layer.cornerRadius = 5.f;
    self.portraitImageView.layer.masksToBounds = YES;
    
    self.conversationButton.layer.cornerRadius = 5.f;
    self.conversationButton.layer.masksToBounds = YES;
    
}

- (void)setUpNav {
    
    self.baseNavigationController.title = @"详细资料";
    
    // 判断userId 是否是当前用户
    // 是 right不设置
    // 否 。。。 action -> 是否拉入黑名单
    
}

/**
 返回
 @author 李鹏飞
 */
- (void)btnLeftOnClick {
    [self.baseNavigationController popViewControllerAnimated:YES];
}

@end
