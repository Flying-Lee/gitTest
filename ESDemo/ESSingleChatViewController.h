//
//  ESSingleChatViewController.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESConversationViewController.h"

@interface ESSingleChatViewController : ESConversationViewController

/**
 *  会话数据模型
 */
@property(strong, nonatomic) RCConversationModel *conversation;
@end
