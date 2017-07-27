//
//  ESAlertTool.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/20.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESAlertTool.h"

@interface ESAlertTool ()

/**
 alertVc
 */
@property (nonatomic, strong) UIAlertController *alertVC;

@end

@implementation ESAlertTool

static ESAlertTool *_instance;

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[ESAlertTool alloc] init];
    });
    
    return _instance;
    
}

+ (instancetype)alertWithType:(UIAlertControllerStyle)alertType
              actions:(NSArray<NSString *> *)actions
           cancelTask:(ESAlertCancelBlock)cancel
              didTask:(ESAlertActionBlock)task
                title:(NSString *)titile
              message:(NSString *)message {
    
    if (!actions.count) {
        actions = @[@"取消", @"确定"];
    }
    
    ESAlertTool *alertTool = [ESAlertTool sharedInstance];
    
    alertTool.alertVC = [UIAlertController alertControllerWithTitle:titile message:message preferredStyle:alertType];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:actions.firstObject style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        !cancel ? : cancel();
    
    }];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:actions.lastObject style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        !task ? : task();

    }];
    
    [alertTool.alertVC addAction:cancelAction];
    [alertTool.alertVC addAction:sureAction];
    
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertTool.alertVC animated:YES completion:nil];
    return alertTool;
}

- (ESAlertTool *)addActionWithName:(NSString *)name didTask:(void (^)())didTask {
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:name
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        
                                                !didTask ? : didTask();
        
    }];
    
    [_instance.alertVC addAction:sureAction];
    
    return self;
    
}

@end
