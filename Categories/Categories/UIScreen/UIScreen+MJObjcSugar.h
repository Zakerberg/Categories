//
//  UIScreen+MJObjcSugar.h
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (MJObjcSugar)
/// 屏幕宽度
+ (CGFloat)mj_screenWidth;
/// 屏幕高度
+ (CGFloat)mj_screenHeight;
/// 分辨率
+ (CGFloat)mj_scale;

@end
