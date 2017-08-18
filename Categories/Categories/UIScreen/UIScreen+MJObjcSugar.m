//
//  UIScreen+MJObjcSugar.m
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "UIScreen+MJObjcSugar.h"

@implementation UIScreen (MJObjcSugar)

+ (CGFloat)mj_screenWidth{
    
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)mj_screenHeight{
    
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)mj_scale{
    
    return [UIScreen mainScreen].scale;
}

@end
