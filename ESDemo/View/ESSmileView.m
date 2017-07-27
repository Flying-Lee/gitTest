//
//  ESSmileView.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/20.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESSmileView.h"
#import "UIView+LPFExtension.h"
#import "ESUpperView.h"

static const NSInteger kDefaultNumberOfSmiles = 5;
static const NSInteger kDefaultScorePercent = 1;
static NSString * const kSmileImageStyleNormal = @"smilingfacegray";
static NSString * const kSmileImageStyleHighlight = @"smilingfaceyellow";

@interface ESSmileView ()

/**
 是否有默认值
 */
@property (nonatomic, assign) BOOL isDefault;

/**
 亮色视图
 */
@property (nonatomic, strong) ESUpperView *upperView;

/**
 灰色视图
 */
@property (nonatomic, strong) ESUpperView *belowView;

@end

@implementation ESSmileView

#pragma mark - Init

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setUp];
    
}


/**
 重写 fullSmileLimited set 方法 默认值为YES

 @param fullSmileLimited 是否以个论
 */
- (void)setFullSmileLimited:(BOOL)fullSmileLimited {
    _fullSmileLimited = fullSmileLimited;
    _isDefault = YES;
}

- (instancetype)initWithFrame:(CGRect)frame
             numberOfSmiles:(NSInteger)numberOfSmiles
                    touchable:(BOOL)touchable
                        index:(NSInteger)index {
    
    if (self = [super initWithFrame:frame]) {

    _numberOfSmiles = numberOfSmiles;
    _touchable = touchable;
    _index = index;
    
    [self setUp];
    }
    return self;
    
}

- (CGFloat)totalScore {
    return 1;
}


/**
 初始化
 */
- (void)setUp {
    
    // 设置 fullSmileLimited 默认为YES
    if (!self.isDefault) {
        self.fullSmileLimited = !self.isDefault;
    }
    
    _totalScore = 1;
    
    // 添加单击手势
    if (self.isTouchable) {
        UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapGr];
    }
    
}


/**
 子视图布局
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.belowView) {
        self.belowView = [ESUpperView creatWithImageName:kSmileImageStyleNormal
                                          numberOfSmiles:self.numberOfSmiles
                                                   frame:self.frame];
        [self addSubview:self.belowView];
    }
    
    if (!self.upperView) {
        self.upperView = [ESUpperView creatWithImageName:kSmileImageStyleHighlight
                                          numberOfSmiles:self.numberOfSmiles
                                                   frame:self.frame];
        [self addSubview:self.upperView];
    }
    
    if (self.currentScore > self.totalScore) {
        self.currentScore = self.totalScore;
    }
    else if (self.currentScore < 0) {
        self.currentScore = 0;
    }
    else {
        self.currentScore = self.currentScore;
    }
    
    CGFloat scorePercent = self.currentScore / self.totalScore;
    
    if (self.isFullSmileLimited) {
        scorePercent = [self changeToCompleteStar:scorePercent];
    }
    
    // 改变上层视图的frame
    self.upperView.frame = CGRectMake(0, 0, self.lpf_width * scorePercent, self.lpf_height);
}

#pragma mark - Event Response

/**
 单击事件
 */
- (void)tapAction:(UITapGestureRecognizer *)sender {
    
    // 转化单击的点
    CGPoint point = [sender locationInView:self];
    CGFloat offset = point.x;
    CGFloat offsetPercent = offset/self.lpf_width;
    
    // 整个笑脸 -> 转化自定义系数
    if (self.isFullSmileLimited) {
        offsetPercent = [self changeToCompleteStar:offsetPercent];
    }
    
    self.currentScore = offsetPercent * self.totalScore;
    
    if ([self.delegate respondsToSelector:@selector(es_didClickSmileViewByScore:atIndex:)]) {
        [self.delegate es_didClickSmileViewByScore:self.currentScore
                                             atIndex:self.index];
    }
}


#pragma mark - Private Methods

/**
 自定义笑脸个数

 @param percent 点击的坐标系数
 @return 自定义的坐标
 */
- (CGFloat)changeToCompleteStar:(CGFloat)percent {
    
    if (percent > 0.0 && percent <= 0.2) return 0.2;
    if (percent > 0.2 && percent <= 0.4) return 0.4;
    if (percent > 0.4 && percent <= 0.6) return 0.6;
    if (percent > 0.6 && percent <= 0.8) return 0.8;
    if (percent > 0.8 && percent <= 1) return 1.0;
    return 0.0;
}

#pragma mark - Accessor
/**
 重写当前打分的 set 方法

 @param currentScore 当前的分数
 */
- (void)setCurrentScore:(CGFloat)currentScore {
    if (_currentScore == currentScore) return;
    _currentScore = currentScore;
    
    [self setNeedsLayout];
}


@end
