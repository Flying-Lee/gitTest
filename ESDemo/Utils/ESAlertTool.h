//
//  ESAlertTool.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/20.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ESAlertCancelBlock)();
typedef void (^ESAlertActionBlock)();

@interface ESAlertTool : NSObject


/**
 alert

 @param alertType alert 类型
 @param actions actions 名称数组
 @param cancel 取消 Block
 @param task 其他 Block
 @param titile 标题
 @param message 副标题
 */
+ (instancetype)alertWithType:(UIAlertControllerStyle)alertType
              actions:(NSArray<NSString *> *)actions
           cancelTask:(ESAlertCancelBlock)cancel
              didTask:(ESAlertActionBlock)task
                title:(NSString *)titile
              message:(NSString *)message;

- (ESAlertTool *)addActionWithName:(NSString *)name didTask:(void (^)())didTask;
@end
