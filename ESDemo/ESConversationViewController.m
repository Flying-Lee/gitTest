//
//  ESConversationViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/17.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESConversationViewController.h"
#import "UIView+LPFExtension.h"

@interface ESConversationViewController ()

@end

@implementation ESConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 客服评价弹出时间，在客服页面停留超过这个时间，离开客服会弹出评价提示框，默认为60s
//    self.csEvaInterval = 0;
    [self notifyUpdateUnreadMessageCount];
    
}


/**
 计时
 */
- (void)notifyUpdateUnreadMessageCount {
    [super notifyUpdateUnreadMessageCount];
    __weak typeof(&*self) __weakself = self;
    int count = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
                                                                @(ConversationType_PRIVATE),
                                                                @(ConversationType_DISCUSSION),
                                                                @(ConversationType_APPSERVICE),
                                                                @(ConversationType_PUBLICSERVICE),
                                                                @(ConversationType_GROUP),
                                                                @(ConversationType_CUSTOMERSERVICE)
                                                                ]];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *backString = nil;
        if (count > 0 && count < 1000) {
            backString = [NSString stringWithFormat:@"返回(%d)", count];
        } else if (count >= 1000) {
            backString = @"返回(...)";
        } else {
            backString = @"返回啊";
        }
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 6, 87, 23);
        UIImageView *backImg = [[UIImageView alloc]
                                initWithImage:[UIImage imageNamed:@"navigator_btn_back"]];
        backImg.frame = CGRectMake(-6, 4, 10, 17);
        [backBtn addSubview:backImg];
        UILabel *backText =
        [[UILabel alloc] initWithFrame:CGRectMake(9, 4, 85, 17)];
        backText.text = backString; // NSLocalizedStringFromTable(@"Back",
        // @"RongCloudKit", nil);
        //   backText.font = [UIFont systemFontOfSize:17];
        [backText setBackgroundColor:[UIColor clearColor]];
        [backText setTextColor:[UIColor whiteColor]];
        [backBtn addSubview:backText];
        [backBtn addTarget:__weakself
                    action:@selector(customerServiceLeftCurrentViewController)
          forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftButton =
        [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        [__weakself.navigationItem setLeftBarButtonItem:leftButton];
    });
}


@end
