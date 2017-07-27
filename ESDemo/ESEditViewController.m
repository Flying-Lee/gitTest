//
//  ESEditViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/12.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESEditViewController.h"
#import "ESTextField.h"
#import "BaseNavigationController.h"

@interface ESEditViewController ()
@property (weak, nonatomic) IBOutlet ESTextField *phoneTF;

@end

@implementation ESEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)back {
    if([self validator]){
        DataCollection *params = [self collect];
        [self.baseNavigationController popViewControllerAnimated:params
                                                        isClosed:YES
                                                        animated:YES];
    }
}

@end
