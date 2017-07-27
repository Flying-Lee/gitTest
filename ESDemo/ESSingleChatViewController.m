//
//  ESSingleChatViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESSingleChatViewController.h"
#import "UIBarButtonItem+LPFExtension.h"
#import "ESPersonDetailViewController.h"

@interface ESSingleChatViewController ()

@property (nonatomic, strong)RCMessageModel *longPressSelectedModel;

@end

@implementation ESSingleChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)setUp {
    
//    [self.chatSessionInputBarControl setInputBarType:RCChatSessionInputBarControlPubType style:RC_CHAT_INPUT_BAR_STYLE_CONTAINER];
    
    // 默认语音输入
    self.defaultInputType = RCChatSessionInputBarInputVoice;
    
    // 修改聊天背景颜色
    self.conversationMessageCollectionView.backgroundColor = [UIColor clearColor];
//    self.view.backgroundColor = [UIColor lightGrayColor];
    // 修改聊天背景图片
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_portrait_msg"]];
    
}

/**
 定义 messagecell 样式
 */
- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if ([cell isMemberOfClass:[RCTextMessageCell class]]) {
        RCTextMessageCell *textCell=(RCTextMessageCell *)cell;
//      自定义气泡图片的适配
//        UIImage *image = textCell.bubbleBackgroundView.image;
//        textCell.bubbleBackgroundView.image=[textCell.bubbleBackgroundView.image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.8,image.size.height * 0.2, image.size.width * 0.2)];
        //      更改字体的颜色
        textCell.textLabel.textColor=[UIColor redColor];
    }
}

- (void)didTapCellPortrait:(NSString *)userId {
    
    ESPersonDetailViewController *detailViewController = [[ESPersonDetailViewController alloc]init];
    detailViewController.userId = userId;
    [self.navigationController pushViewController:detailViewController
                                         animated:YES];
    
}

/**
 长按消息产生的选项菜单
 @param  model 对应cell的模型
 @param  view  在哪个视图上显示
 @author 李鹏飞
 */
//- (void)didLongTouchMessageCell:(RCMessageModel *)model inView:(UIView *)view {
//    self.chatSessionInputBarControl.inputTextView.disableActionMenu = YES;
//    self.longPressSelectedModel = model;
//    
//    NSMutableArray<UIMenuItem *> *menuList = [[self getLongTouchMessageCellMenuList:model] mutableCopy];
//    
//    CGRect rect = [self.view convertRect:view.frame fromView:view.superview];
//    
//    UIMenuController *menu = [UIMenuController sharedMenuController];
//    UIMenuItem *copyItem = [[UIMenuItem alloc]
//                            initWithTitle:NSLocalizedStringFromTable(@"Copy", @"RongCloudKit", nil)
//                            action:@selector(onCopyMessage:)];
//    UIMenuItem *deleteItem = [[UIMenuItem alloc]
//                              initWithTitle:NSLocalizedStringFromTable(@"Delete", @"RongCloudKit", nil)
//                              action:@selector(onDeleteMessage:)];
//    UIMenuItem *deCopyItem = [[UIMenuItem alloc]
//                              initWithTitle:NSLocalizedStringFromTable(@"DeCopy", @"RongCloudKit", nil)
//                              action:@selector(onDeleteMessage:)];
//    if ([model.content isMemberOfClass:[RCTextMessage class]]) {
//        
//        [menu setMenuItems:@[copyItem, deleteItem, deCopyItem]];
//    } else {
//        [menu setMenuItems:@[ deleteItem ]];
//    }
//    UIMenuItem *deCopyItem = [[UIMenuItem alloc]initWithTitle:NSLocalizedStringFromTable(@"DeCopy", @"RongCloudKit", nil)
//                              
//                                                       action:@selector(onDeleteMessage:)];
//    
////    [menuList addObject:deCopyItem];
//    [menu setMenuItems:menuList];
//    [menu setTargetRect:rect inView:self.view];
//    [menu setMenuVisible:YES animated:YES];
//}


@end
