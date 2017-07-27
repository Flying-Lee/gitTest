//
//  UIBarButtonItem+LPFExtension.h
//  匹克托福
//
//  Created by apple on 2016/12/9.
//  Copyright © 2016年 flying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LPFExtension)
/**
 *  设置导航控制器的item属性
 */
+ (instancetype)itemWithImage:(NSString *)normalImage
                    highImage:(NSString *)highImage
                       target:(id)target
                       action:(SEL)action;

+ (instancetype)itemWithTarget:(id)target
                        action:(SEL)action
                    titleColor:(UIColor *)titleColor
                         title:(NSString *)title
                 selectedTitle:(NSString *)selectedTitle;
/**
 *  设置导航控制器带文字的item属性
 */
+ (instancetype)itemWithImage:(UIImage *)normalImage
                    highImage:(UIImage *)highImage
                       target:(id)target
                       action:(SEL)action
                        title:(NSString *)title;
@end
