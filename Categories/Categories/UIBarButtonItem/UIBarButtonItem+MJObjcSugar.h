//
//  UIBarButtonItem+MJObjcSugar.h
//  Categories
//
//  Created by Michael 柏 on 2017/10/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MJObjcSugar)

//快速创建导航栏按钮
+ (instancetype) mj_barButtonItemWithTitle: (NSString *)title imageName: (NSString *)imageName target: (id) target action: (SEL)action fontSize: (CGFloat)fontSize titleNormalColor: (UIColor *)normalColor titleHighlightedColor: (UIColor *)highlightColor;


@end
