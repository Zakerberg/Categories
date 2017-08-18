//
//  UIView+MJObjcSugar.h
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MJObjcSugar)

#pragma mark - Frame
/// 视图原点
@property (nonatomic) CGPoint mj_viewOrigin;
/// 视图尺寸
@property (nonatomic) CGSize mj_viewSize;

#pragma mark - Frame Origin
/// frame 原点 x 值
@property (nonatomic) CGFloat mj_x;
/// frame 原点 y 值
@property (nonatomic) CGFloat mj_y;

#pragma mark - Frame Size
/// frame 尺寸 width
@property (nonatomic) CGFloat mj_width;
/// frame 尺寸 height
@property (nonatomic) CGFloat mj_height;

#pragma mark - 截屏
/// 当前视图内容生成的图像
@property (nonatomic, readonly, nullable)UIImage *mj_capturedImage;


@end
