//
//  ESUpperView.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/21.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESUpperView.h"
#import "UIView+LPFExtension.h"

@implementation ESUpperView


/**
 初始化

 @param imageName 笑脸图片名字
 @param numberOfSmiles 笑脸个数
 @param frame frame
 */
+ (instancetype)creatWithImageName:(NSString *)imageName
                  numberOfSmiles:(NSInteger)numberOfSmiles
                             frame:(CGRect)frame {
    ESUpperView *upperView = [[ESUpperView alloc] init];
    upperView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    upperView.backgroundColor = [UIColor clearColor];
    upperView.clipsToBounds = YES;
    
    CGFloat w = upperView.lpf_width / numberOfSmiles;
    CGFloat imageW = upperView.lpf_height - 10;
    
    for (NSInteger i = 0; i < numberOfSmiles; i++) {
        
        UIImageView *starImageView = [[UIImageView alloc] init];
        starImageView.image = [UIImage imageNamed:imageName];
        
        CGFloat smileX = i * w;
        
        starImageView.frame = CGRectMake(smileX, 5, imageW, imageW);
        
        starImageView.contentMode =  UIViewContentModeScaleAspectFit;
        
        [upperView addSubview:starImageView];
        
    }

    return upperView;
}

@end
