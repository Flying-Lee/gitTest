//
//  ESUpperView.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/21.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESUpperView : UIView

/**
 图片名称
 */
@property (nonatomic, copy) NSString *imageName;

/**
 笑脸个数
 */
@property (nonatomic, assign) NSInteger numberOfSmilings;

+ (instancetype)creatWithImageName:(NSString *)imageName numberOfSmiles:(NSInteger)numberOfSmiles frame:(CGRect)frame;

@end
