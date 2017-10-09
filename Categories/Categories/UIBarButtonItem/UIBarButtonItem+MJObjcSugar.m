//
//  UIBarButtonItem+MJObjcSugar.m
//  Categories
//
//  Created by Michael 柏 on 2017/10/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "UIBarButtonItem+MJObjcSugar.h"

@implementation UIBarButtonItem (MJObjcSugar)

//快速创建导航栏按钮
+ (instancetype) mj_barButtonItemWithTitle: (NSString *)title imageName: (NSString *)imageName target: (id) target action: (SEL)action fontSize: (CGFloat)fontSize titleNormalColor: (UIColor *)normalColor titleHighlightedColor: (UIColor *)highlightColor{
    
    
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highlightColor forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
