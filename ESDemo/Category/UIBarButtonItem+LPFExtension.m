//
//  UIBarButtonItem+LPFExtension.m
//  匹克托福
//
//  Created by apple on 2016/12/9.
//  Copyright © 2016年 flying. All rights reserved.
//

#import "UIBarButtonItem+LPFExtension.h"

@implementation UIBarButtonItem (LPFExtension)
/**
 *  设置导航控制器的item属性
 */
+ (instancetype)itemWithImage:(NSString *)normalImage
                    highImage:(NSString *)highImage
                       target:(id)target
                       action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 尺寸自适应
    [button sizeToFit];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

/**
 *  设置导航控制器的右边的item属性
 */
+ (instancetype)itemWithTarget:(id)target
                        action:(SEL)action
                    titleColor:(UIColor *)titleColor
                         title:(NSString *)title
                 selectedTitle:(NSString *)selectedTitle {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    // 尺寸自适应
    [button sizeToFit];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

/**
 *  设置导航控制器的返回item
 */
+ (instancetype)itemWithImage:(UIImage *)normalImage
                    highImage:(UIImage *)highImage
                       target:(id)target
                       action:(SEL)action
                        title:(NSString *)title {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:normalImage forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRed:150 green:150 blue:150 alpha:1] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    // 调整图标和文字的内边距
    [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[self alloc] initWithCustomView:backButton];
}

///**
// *  设置导航控制器的返回item不带文字
// */
//+ (instancetype)itemWithImage:(UIImage *)normalImage
//                    highImage:(UIImage *)highImage
//                       target:(id)target
//                       action:(SEL)action {
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setImage:normalImage forState:UIControlStateNormal];
//    [backButton setImage:highImage forState:UIControlStateHighlighted];
//    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [backButton sizeToFit];
//    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    return  [[self alloc] initWithCustomView:backButton];
//}
@end
