//
//  ESPersonDetailViewController.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/14.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESLibrary.h"

@interface ESPersonDetailViewController : BaseViewController

@property (nonatomic, copy) NSString *userId;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *setRemarkButton;
@property (weak, nonatomic) IBOutlet UIButton *conversationButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *conversationButtonTop;

@end
