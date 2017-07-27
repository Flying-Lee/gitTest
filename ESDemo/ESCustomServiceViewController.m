//
//  ESCustomServiceViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/17.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESCustomServiceViewController.h"
#import "ESServiceEvaluateViewController.h"
#import "ESLibrary.h"
#import "ESAlertTool.h"

@interface ESCustomServiceViewController ()

/**/
// 应用自定义评价界面开始1
@property (nonatomic, strong)NSString *commentId;
@property (nonatomic)RCCustomerServiceStatus serviceStatus;
@property (nonatomic)BOOL quitAfterComment;
// 应用自定义评价界面结束1
/**/

@end

@implementation ESCustomServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.csEvaInterval = 0;
    self.navigationItem.rightBarButtonItem = nil;
    
    [self.chatSessionInputBarControl.pluginBoardView removeItemWithTag:1003];
    // 分支 test

    // App Code Test
}

/**
 
 等待用户评价结束后调用如下函数离开当前VC。
 
 客服VC左按键注册的selector是customerServiceLeftCurrentViewController
 这个函数是基类的函数，他会根据当前服务时间来决定是否弹出评价，根据服务的类型来决定弹出评价类型。
 弹出评价的函数是commentCustomerServiceAndQuit，应用可以根据这个函数内的注释来自定义评价界面。
 */
- (void)leftBarButtonItemPressed:(id)sender {
    //需要调用super的实现
    [super leftBarButtonItemPressed:sender];

    [self.navigationController popViewControllerAnimated:YES];
}
/**
 评价客服，并离开当前会话
 
 1. 需要自定义客服评价界面，请把本函数注释掉，并打开“应用自定义评价界面开始1/2”到“应用自定义评价界面结束”部分的代码，然后根据您的需求进行修改。
 2. 需要去掉客服评价界面，请把本函数注释掉，并打开下面“应用去掉评价界面开始”到“应用去掉评价界面结束”部分的代码，然后根据您的需求进行修改。
 
 @param serviceStatus 服务状态
 @param commentId     ID
 @param isQuit        是否退出
 */
//- (void)commentCustomerServiceWithStatus:(RCCustomerServiceStatus)serviceStatus
//                               commentId:(NSString *)commentId
//                        quitAfterComment:(BOOL)isQuit {
//    [super commentCustomerServiceWithStatus:serviceStatus
//                                  commentId:commentId
//                           quitAfterComment:isQuit];
//}

/**
 
 // 应用去掉评价界面
 
 - (void)commentCustomerServiceWithStatus:(RCCustomerServiceStatus)serviceStatus
 commentId:(NSString *)commentId quitAfterComment:(BOOL)isQuit {
 if (isQuit) {
 [self leftBarButtonItemPressed:nil];
 }
 }
 
 */

/**/
// 应用自定义评价界面开始2
- (void)commentCustomerServiceWithStatus:(RCCustomerServiceStatus)serviceStatus
                               commentId:(NSString *)commentId quitAfterComment:(BOOL)isQuit {
    self.serviceStatus = serviceStatus;
    self.commentId = commentId;
    self.quitAfterComment = isQuit;
    if (serviceStatus == RCCustomerService_NoService) {
        [self leftBarButtonItemPressed:nil];
    } else if (serviceStatus == RCCustomerService_HumanService) {
        
        [ESAlertTool alertWithType:UIAlertControllerStyleAlert
                           actions:@[@"残忍拒绝", @"去评价"]
                        cancelTask:^{
                            [self leftBarButtonItemPressed:nil];
                        }
                           didTask:^{
                               [self.navigationController pushViewController:[[ESServiceEvaluateViewController alloc] init] animated:YES];
                           }
                             title:@"会话结束"
                           message:@"是否评价我们的人工服务？"];
        
    } else {
        
        NSString *title = @"会话结束";
        NSString *message = @"是否评价我们的机器人服务？";
        
        [[[ESAlertTool alertWithType:UIAlertControllerStyleAlert
                           actions:@[@"残忍拒绝", @"去评价"]
                        cancelTask:^{
                            [self leftBarButtonItemPressed:nil];
                        }
                           didTask:^{
                               [self.navigationController pushViewController:[[ESServiceEvaluateViewController alloc] init] animated:YES];
                           }
                             title:title
                           message:message]
                 addActionWithName:@"哈哈"
                           didTask:^{
            NSLog(@"点击了新的 action");
        }] addActionWithName:@"呵呵呵呵" didTask:^{
            NSLog(@"又点击了另一个新 action");
        }];
    }
}

@end
