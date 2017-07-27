//
//  ESTestChatListViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESTestChatListViewController.h"
#import "ESSingleChatViewController.h"
#import "UIBarButtonItem+LPFExtension.h"
#import "ESConversationBaseCell.h"


@interface ESTestChatListViewController ()

@end

@implementation ESTestChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setUpNav];
}

/**
 初始化
 */
- (void)setUp {
    
    // 是否显示网络状态
    self.isShowNetworkIndicatorView = YES;
    // 是否显示连接状态
    self.showConnectingStatusOnNavigatorBar = YES;
    // 列表为空时显示的View
//    self.emptyConversationView = [UIView new];
    
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    // 隐藏多余分割线
    self.conversationListTableView.tableFooterView = [UIView new];
}


- (void)setUpNav {

    self.navigationItem.title = @"量体Chat";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self
                                                                      action:@selector(newTalk)
                                                                  titleColor:[UIColor whiteColor]
                                                                       title:@"新建聊天"
                                                               selectedTitle:nil];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"back"
                                                                 highImage:nil
                                                                    target:self
                                                                    action:@selector(btnLeftOnClick)];
}


/**
 返回
 @author 李鹏飞
 */
- (void)btnLeftOnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 新建聊天
 */
- (void)newTalk {
    
    NSString *user1title = @"user001";
    NSString *user2title = @"user002";
    NSString *user3title = @"user003";
    NSString *user4title = @"user004";
    NSString *target1Id = @"10001";
    NSString *target2Id = @"10002";
    NSString *target3Id = @"10003";
    NSString *target4Id = @"10004";
    
    ESSingleChatViewController *singleChatVc = [ESSingleChatViewController new];
    singleChatVc.title = user4title;
    singleChatVc.conversationType = ConversationType_PRIVATE;
    singleChatVc.targetId = target4Id;
    [self.navigationController pushViewController:singleChatVc animated:YES];
}


//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    
   
    ESSingleChatViewController *conversationVC = [ESSingleChatViewController new];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    conversationVC.conversation = model;
    [self.navigationController pushViewController:conversationVC animated:YES];
}



- (void)test {
    //    for (int i = 0; i < dataSource.count; i++) {
    //        RCConversationModel *model = dataSource[i];
    //        //筛选请求添加好友的系统消息，用于生成自定义会话类型的cell
    //        if (model.conversationType == ConversationType_SYSTEM &&
    //            [model.lastestMessage
    //             isMemberOfClass:[RCContactNotificationMessage class]]) {
    //                model.conversationModelType = RC_CONVERSATION_MODEL_TYPE_CUSTOMIZATION;
    //            }
    //        if ([model.lastestMessage
    //             isKindOfClass:[RCGroupNotificationMessage class]]) {
    //            RCGroupNotificationMessage *groupNotification =
    //            (RCGroupNotificationMessage *)model.lastestMessage;
    //            if ([groupNotification.operation isEqualToString:@"Quit"]) {
    //                NSData *jsonData =
    //                [groupNotification.data dataUsingEncoding:NSUTF8StringEncoding];
    //                NSDictionary *dictionary = [NSJSONSerialization
    //                                            JSONObjectWithData:jsonData
    //                                            options:NSJSONReadingMutableContainers
    //                                            error:nil];
    //                NSDictionary *data =
    //                [dictionary[@"data"] isKindOfClass:[NSDictionary class]]
    //                ? dictionary[@"data"]
    //                : nil;
    //                NSString *nickName =
    //                [data[@"operatorNickname"] isKindOfClass:[NSString class]]
    //                ? data[@"operatorNickname"]
    //                : nil;
    //                if ([nickName isEqualToString:[RCIM sharedRCIM].currentUserInfo.name]) {
    //                    [[RCIMClient sharedRCIMClient]
    //                     removeConversation:model.conversationType
    //                     targetId:model.targetId];
    //                    [self refreshConversationTableViewIfNeeded];
    //                }
    //            }
    //        }
    //    }
    //    

}

//-(void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell
//
//                            atIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    //获取cell对应的model
//    
//    RCConversationModel *model=cell.model;
//    
//    //根据model的某个属性判断
//    
//    if (model.conversationType == ConversationType_PRIVATE) {
//        
//        //强转为具体的cell
//        
//        RCConversationCell *concell = (RCConversationCell *)cell;
//        
//        concell.conversationTitle.textColor = [UIColor blueColor];
//        concell.cellBackgroundColor = [UIColor redColor];
//        
//    }
//    
//}

//插入自定义会话model
- (NSMutableArray *)willReloadTableData:(NSMutableArray *)dataSource {
    
    for (RCConversationModel *model in dataSource) {
        model.conversationModelType = RC_CONVERSATION_MODEL_TYPE_CUSTOMIZATION;
    }
    
    return dataSource;
}

- (CGFloat)rcConversationListTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


/**
 根据不同的 model.conversationType 自定义cell
*/

- (RCConversationBaseCell *)rcConversationListTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RCConversationModel *model = self.conversationListDataSource[indexPath.row];
    ESConversationBaseCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ESConversationBaseCell class]) owner:self options:nil][0];
    
    cell.userNameLabel.text = [NSString stringWithFormat:@"hhh%@", model.targetId];
    cell.headerImageView.image = [UIImage imageNamed:@"default_portrait_msg"];
    cell.timeLabel.text = [RCKitUtility ConvertMessageTime:model.sentTime/1000];
    cell.detailLabel.text = [self lastestMessage:model.lastestMessage identifier:model.objectName];

    return cell;
    
}

- (NSString *)lastestMessage:(RCMessageContent *)msg
                  identifier:(NSString *)identifer {
    
    // 文本消息类
    if ([identifer isEqualToString:RCTextMessageTypeIdentifier]) {
        RCTextMessage *textMsg = (RCTextMessage *)msg;
        return textMsg.content;
    }
    // 语音消息类
    if ([identifer isEqualToString:RCVoiceMessageTypeIdentifier]) {
        return @"[语音]";
    }
    // 图片消息类
    if ([identifer isEqualToString:RCImageMessageTypeIdentifier]) {
        return @"[图片]";
    }
    // 位置消息类
    if ([identifer isEqualToString:RCLocationMessageTypeIdentifier]) {
        return @"[位置]";
    }
    
    // RCCommandNotificationMessageIdentifier - 命令提醒消息
    // RCContactNotificationMessageIdentifier - 好友请求消息
    // RCCSLeaveMessageTypeIdentifier         - ?
    // RCCSPullLeaveMessageTypeIdentifier     - ？
    // RCDiscussionNotificationTypeIdentifier - 讨论组通知消息
    // RCCommandMessageIdentifier             - 命令消息
    // RCFileMessageTypeIdentifier            - 文件消息
    // RCSightMessageTypeIdentifier           - 小视频
    // RCUnknownMessageTypeIdentifier         - 未知消息
    // RCRichContentMessageTypeIdentifier     - 图文消息
    // RCProfileNotificationMessageIdentifier - 公众服务账号信息变更消息的类型名
    // RCGroupNotificationMessageIdentifier   - 群组通知消息的类型名
    
    return nil;
    
}

//- (RCConversationBaseCell *)rcConversationListTableView:(UITableView *)tableView
//                                  cellForRowAtIndexPath:
//(NSIndexPath *)indexPath {
//    RCConversationModel *model = self.conversationListDataSource[indexPath.row];
//    
//    __block NSString *userName = nil;
//    __block NSString *portraitUri = nil;
//    RCContactNotificationMessage *_contactNotificationMsg = nil;
//    
//    __weak ESTestChatListViewController *weakSelf = self;
//    //此处需要添加根据userid来获取用户信息的逻辑，extend字段不存在于DB中，当数据来自db时没有extend字段内容，只有userid
//    if (nil == model.extend) {
//        // Not finished yet, To Be Continue...
//        if (model.conversationType == ConversationType_SYSTEM &&
//            [model.lastestMessage
//             isMemberOfClass:[RCContactNotificationMessage class]]) {
//                _contactNotificationMsg =
//                (RCContactNotificationMessage *)model.lastestMessage;
//                if (_contactNotificationMsg.sourceUserId == nil) {
//                    RCDChatListCell *cell =
//                    [[RCDChatListCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                           reuseIdentifier:@""];
//                    cell.lblDetail.text = @"好友请求";
//                    [cell.ivAva sd_setImageWithURL:[NSURL URLWithString:portraitUri]
//                                  placeholderImage:[UIImage imageNamed:@"system_notice"]];
//                    return cell;
//                }
//                NSDictionary *_cache_userinfo = [[NSUserDefaults standardUserDefaults]
//                                                 objectForKey:_contactNotificationMsg.sourceUserId];
//                if (_cache_userinfo) {
//                    userName = _cache_userinfo[@"username"];
//                    portraitUri = _cache_userinfo[@"portraitUri"];
//                } else {
//                    NSDictionary *emptyDic = @{};
//                    [[NSUserDefaults standardUserDefaults]
//                     setObject:emptyDic
//                     forKey:_contactNotificationMsg.sourceUserId];
//                    [[NSUserDefaults standardUserDefaults] synchronize];
//                    [RCDHTTPTOOL
//                     getUserInfoByUserID:_contactNotificationMsg.sourceUserId
//                     completion:^(RCUserInfo *user) {
//                         if (user == nil) {
//                             return;
//                         }
//                         RCDUserInfo *rcduserinfo_ = [RCDUserInfo new];
//                         rcduserinfo_.name = user.name;
//                         rcduserinfo_.userId = user.userId;
//                         rcduserinfo_.portraitUri = user.portraitUri;
//                         
//                         model.extend = rcduserinfo_;
//                         
//                         // local cache for userInfo
//                         NSDictionary *userinfoDic = @{
//                                                       @"username" : rcduserinfo_.name,
//                                                       @"portraitUri" : rcduserinfo_.portraitUri
//                                                       };
//                         [[NSUserDefaults standardUserDefaults]
//                          setObject:userinfoDic
//                          forKey:_contactNotificationMsg.sourceUserId];
//                         [[NSUserDefaults standardUserDefaults] synchronize];
//                         
//                         [weakSelf.conversationListTableView
//                          reloadRowsAtIndexPaths:@[ indexPath ]
//                          withRowAnimation:
//                          UITableViewRowAnimationAutomatic];
//                     }];
//                }
//            }
//        
//    } else {
//        RCDUserInfo *user = (RCDUserInfo *)model.extend;
//        userName = user.name;
//        portraitUri = user.portraitUri;
//    }
//    
//    RCDChatListCell *cell =
//    [[RCDChatListCell alloc] initWithStyle:UITableViewCellStyleDefault
//                           reuseIdentifier:@""];
//    NSString *operation = _contactNotificationMsg.operation;
//    NSString *operationContent;
//    if ([operation isEqualToString:@"Request"]) {
//        operationContent = [NSString stringWithFormat:@"来自%@的好友请求", userName];
//    } else if ([operation isEqualToString:@"AcceptResponse"]) {
//        operationContent = [NSString stringWithFormat:@"%@通过了你的好友请求", userName];
//    }
//    cell.lblDetail.text = operationContent;
//    [cell.ivAva sd_setImageWithURL:[NSURL URLWithString:portraitUri]
//                  placeholderImage:[UIImage imageNamed:@"system_notice"]];
//    cell.labelTime.text = [RCKitUtility ConvertMessageTime:model.sentTime/1000];
//    cell.model = model;
//    return cell;
//}


@end
