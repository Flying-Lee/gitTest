//
//  ESDataManager.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESDataManager.h"
#import <RongIMKit/RongIMKit.h>

@interface ESDataManager ()<RCIMUserInfoDataSource>


@end

@implementation ESDataManager

static ESDataManager *_instance;

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[ESDataManager alloc] init];
        
    });
    
    return _instance;
    
}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion {
    
    if (userId.length == 0 && !userId) {
        completion = nil;
        return;
    }
    
    // 保存数据库
    // 保存属性列表
    
//    
//    if ([userId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
//        id userInfo = [appsettings]
//    }
//    
}

@end
