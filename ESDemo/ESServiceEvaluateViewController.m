//
//  ESServiceEvaluateViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/20.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESServiceEvaluateViewController.h"
#import "ESSmileView.h"
#import "ESPhotoAddView.h"

@interface ESServiceEvaluateViewController ()<ESSmileViewDelegate, PhotosDidAddDelegate>
@property (weak, nonatomic) IBOutlet ESSmileView *attitudeSmileView;
@property (weak, nonatomic) IBOutlet ESSmileView *degreeSmileView;
@property (weak, nonatomic) IBOutlet UILabel *attitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *degreeLabel;
@property (weak, nonatomic) IBOutlet ESPhotoAddView *photoAddView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topVeiwHeight;

/**
 服务态度数组
 */
@property (nonatomic, strong) NSArray *attitudes;

/**
 解决程度数组
 */
@property (nonatomic, strong) NSArray *degrees;

@end

@implementation ESServiceEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.attitudeSmileView.delegate = self;
    self.degreeSmileView.delegate = self;
    
    _attitudes = @[@"非常差", @"差", @"一般", @"好", @"非常好"];
    _degrees   = @[@"答非所问", @"没有解决", @"暂时解决", @"已解决", @"完美解决"];
    
    Class someClass = NSClassFromString(@"UIDebuggingInformationOverlay");
    id obj = [someClass performSelector:NSSelectorFromString(@"overlay")];
    [obj performSelector:NSSelectorFromString(@"toggleVisibility")];
    
    self.photoAddView.delegate = self;
    
}

- (void)photo:(CGFloat)photoAddViewHigh {
    self.topVeiwHeight.constant = 120 + photoAddViewHigh;
}

- (void)btnLeftOnClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)btnRightOnClick {
    
    //    [[RCIMClient sharedRCIMClient]
    //            evaluateCustomerService:self.targetId dialogId:self.commentId
    //            humanValue:0 suggest:nil];
    
}

#pragma mark - Event
- (void)es_didClickSmileViewByScore:(CGFloat)score atIndex:(NSInteger)index {
    
    NSInteger scoreI = score * 5;
    
    index == 0 ? (self.attitudeLabel.text = _attitudes[scoreI - 1]) : (self.degreeLabel.text = _degrees[scoreI - 1]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
