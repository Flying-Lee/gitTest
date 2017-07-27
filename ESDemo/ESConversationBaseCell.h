//
//  ESConversationBaseCell.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface ESConversationBaseCell : RCConversationBaseCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
