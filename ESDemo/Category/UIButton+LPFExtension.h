//
//  UIButton+LPFExtension.h
//  匹克托福
//
//  Created by apple on 2017/2/15.
//  Copyright © 2017年 flying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LPFExtension)
/**
 *  快速创建一个button
 */
+ (UIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                                  title:(NSString *)title
                         titleLabelFont:(UIFont *)font
                             titleColor:(UIColor *)titleColor
                                 target:(id)target
                                 action:(SEL)action
                          clipsToBounds:(BOOL)clipsToBounds;

+ (UIButton *)buttonWithTitleLabelFont:(UIFont *)font
                            titleColor:(UIColor *)titleColor
                                 image:(UIImage *)image
                           selectImage:(UIImage *)selectImage
                                target:(id)target
                                action:(SEL)action
                         clipsToBounds:(BOOL)clipsToBounds
                                 Title:(NSString *)title;

+ (UIButton *)buttonWithTitleLabelFont:(UIFont *)font
                            titleColor:(UIColor *)titleColor
                                target:(id)target
                                action:(SEL)action
                                 Title:(NSString *)title
                         SelectedTitle:(NSString *)selectedTitle;

/**
 *  快速创建一个带边框的button
 */
+ (UIButton *)borderButtonWithBackgroundColor:(UIColor *)backgroundColor
                                        title:(NSString *)title
                               titleLabelFont:(UIFont *)font
                                   titleColor:(UIColor *)titleColor
                                       target:(id)target
                                       action:(SEL)action
                                clipsToBounds:(BOOL)clipsToBounds;


@end
