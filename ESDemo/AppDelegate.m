//
//  AppDelegate.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/10.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "ESLoginViewController.h"
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()<RCIMUserInfoDataSource, RCIMGroupInfoDataSource>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self debug];
    // 初始化融云
    [self setUpRCIM];
    // 初始化rootVC
    BaseNavigationController *rootViewController = [[BaseNavigationController alloc]initWithViewController:[[ESLoginViewController  alloc] init]];
    
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)debug {
    
    Class debugClass = NSClassFromString(@"UIDebuggingInformationOverlay");
    [debugClass performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];
}

- (void)setUpRCIM {
    [[RCIM sharedRCIM] initWithAppKey:@"82hegw5u8krpx"];
    
    // 以下根据自己项目需求.进行设置
    [RCIM sharedRCIM].enablePersistentUserInfoCache = YES;                  //  开启用户信息和群组信息的持久化
    [RCIM sharedRCIM].userInfoDataSource = self;                  // 设置RongCloud用户信息数据源
    [RCIM sharedRCIM].groupInfoDataSource = self;               //  设置RongCloud群组信息数据源
    [RCIM sharedRCIM].enableMessageAttachUserInfo = YES;                    //  是否在发送的所有消息中携带当前登录的用户信息
//    [RCIM sharedRCIM].receiveMessageDelegate = self;                            //  设置接收消息代理
    [RCIM sharedRCIM].enableTypingStatus =YES;                                  //  开启输入状态监听
    [RCIM sharedRCIM].showUnkownMessage = YES;                              //  设置显示未注册的消息
    [RCIM sharedRCIM].showUnkownMessageNotificaiton = YES;              //  未注册的消息类型是否显示本地通知
    [RCIM sharedRCIM].disableMessageAlertSound = YES;                       //  声音提示
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];                   //  设置会话列表头像和会话界面头像
//    [[RCIM sharedRCIM] registerMessageType:[RRTCustomFriendMessage class]];     //  注册自定义消息类型
    
    // 圆形头像
//    [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;

    //  SDK会话列表界面中显示的头像大小，高度必须大于或者等于36 @discussion 默认值为46*46
    [RCIM sharedRCIM].globalConversationPortraitSize = CGSizeMake(50, 50);
    
    NSString *im1Token = @"p/CUbbIpA93PsxkIrPgqoQ1OP37AHfa8L7E4vSa8kZd17wc+5ZnYseS5Ia42nl/EJUWPsBjZFPNlawOAQ5xufw==";
    
    NSString *im2Token = @"jzZGGTScfl6o2ttaOonVW9HnP+yGjLqNwN+Q7VGVnx+XcAqX9pSF1a2zPZMpDOlccLRSJuVR2TRz9e48IeuIkw==";
    
    NSString *im3Token = @"yn7s/q7aUoxceFLhFzFv2A1OP37AHfa8L7E4vSa8kZd17wc+5ZnYsVkFXD7YS8lS/xOQRw2eQjbQwy11Vbnmng==";
    
    NSString *im4Token = @"GQtwj1djKiAyK7Ew5xJxlHVTmCNLYkr5pG9n7YMaqIEZ6HZT0GqTSH8ma13ExscKiJTx+Fh/rI8dI4lQPOYfeQ==";
    
    [[RCIM sharedRCIM] connectWithToken:im1Token success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%zd", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    
}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion {
    
    if (userId.length) {
        NSLog(@"=====-----> %@", userId);
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
