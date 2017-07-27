//
//  ESLoginViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/11.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESLoginViewController.h"
#import "ESEditViewController.h"
#import "ESTextField.h"
#import "BaseNavigationController.h"
#import "Database.h"
#import "ESTestChatListViewController.h"
#import "ESCustomServiceViewController.h"
#import "ESContactViewController.h"
#import "ESWebViewController.h"

// 客服ID
#define SERVICE_ID @"KEFU150001294940772"

@interface ESLoginViewController ()

@property (weak, nonatomic) IBOutlet ESTextField *phoneTf;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *webService;

@end

@implementation ESLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.nextButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        [self.baseNavigationController pushViewController:[[ESTestChatListViewController alloc] init] animated:YES];
        
    }];}


#pragma mark - ButtonClick

/**
 query - 客服
 @author 李鹏飞
 */
- (IBAction)query {
    
//    Database *dataBase = [[Database alloc] initDatabase];
//    DataTable *dataTable = [dataBase executeTable:@"spHello" params:nil];
//    NSLog(@"%zd", dataTable.count);
    
    // 客服
    ESCustomServiceViewController *chatService = [[ESCustomServiceViewController alloc] init];
    chatService.conversationType = ConversationType_CUSTOMERSERVICE;
    chatService.targetId = SERVICE_ID;
    chatService.title = @"客服";
    
    [self.baseNavigationController pushViewController:chatService animated:YES];
    
}

/**
 friends - 联系人列表
 @author 李鹏飞
 */
- (IBAction)friends {
    
    // ESContactViewController *contactVc = [ESContactViewController new];
    [self.baseNavigationController pushViewController:[[ESContactViewController alloc] init] animated:YES];
}

- (IBAction)wenServiceButtonClick {
    ESWebViewController *webVc = [[ESWebViewController alloc] init];
    [self.baseNavigationController pushViewController:webVc leftBackHidden:NO animated:YES];
}


@end
