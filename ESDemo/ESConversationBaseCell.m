//
//  ESConversationBaseCell.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESConversationBaseCell.h"

@implementation ESConversationBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    }

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.height * 0.5;
    self.headerImageView.clipsToBounds = YES;

}
@end
