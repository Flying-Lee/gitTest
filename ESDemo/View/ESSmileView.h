//
//  ESSmileView.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/20.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ESSmileViewDelegate <NSObject>


/**
 打分视图代理

 @param score 打分
 @param index 视图标记
 */
- (void)es_didClickSmileViewByScore:(CGFloat)score atIndex:(NSInteger)index;

@end

@interface ESSmileView : UIView


/**
 视图的标记
 */
@property (nonatomic, assign) IBInspectable NSInteger index;

/**
 笑脸个数
 */
@property (nonatomic, assign) IBInspectable NSInteger numberOfSmiles;

/**
 评分的总分值，默认为1
 */
@property (nonatomic, assign) CGFloat totalScore;

/**
 评分的当前分数，默认为0
 */
@property (nonatomic, assign) CGFloat currentScore;

/**
 是否可以点击
 */
@property (nonatomic, assign, getter=isTouchable) IBInspectable BOOL touchable;

/**
 是否限制只能有整个笑脸，默认为YES
 */
@property (nonatomic, assign, getter=isFullSmileLimited) IBInspectable BOOL fullSmileLimited;

@property (nonatomic, weak) id <ESSmileViewDelegate> delegate;


/**
 视图初始化

 @param frame 视图尺寸
 @param numberOfSmiles 笑脸个数
 @param touchable 是否可点击
 @param index 视图标识
 @return 视图
 */
- (instancetype)initWithFrame:(CGRect)frame
                numberOfSmiles:(NSInteger)numberOfSmiles
                  touchable:(BOOL)touchable
                        index:(NSInteger)index;

@end
