//
//  UIButton+MJObjcSugar.h
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MJObjcSugar)

/// 实例化 UIButton
///
/// @param title           title
/// @param fontSize        fontSize
/// @param textColor       textColor
///
/// @return UIButton
+ (nonnull instancetype)mj_buttonWithTitle:(nullable NSString *)title
                                  fontSize:(CGFloat)fontSize
                                 textColor:(nonnull UIColor *)textColor;

/// 实例化 UIButton
///
/// @param attributedText  attributedText
///
/// @return UIButton
+ (nonnull instancetype)mj_buttonWithAttributedText:(nullable NSAttributedString *)attributedText;

/// 实例化 UIButton
///
/// @param imageName       imageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)mj_buttonWithImageName:(nullable NSString *)imageName
                               highlightSuffix:(nullable NSString *)highlightSuffix;

/// 实例化 UIButton
///
/// @param imageName       imageName
/// @param backImageName   backImageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)mj_buttonWithImageName:(nullable NSString *)imageName
                                 backImageName:(nullable NSString *)backImageName
                               highlightSuffix:(nullable NSString *)highlightSuffix;

/// 实例化 UIButton
///
/// @param title           title
/// @param fontSize        fontSize
/// @param textColor       textColor
/// @param imageName       imageName
/// @param backImageName   backImageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)mj_buttonWithTitle:(nullable NSString *)title
                                  fontSize:(CGFloat)fontSize
                                 textColor:(nonnull UIColor *)textColor
                                 imageName:(nullable NSString *)imageName
                             backImageName:(nullable NSString *)backImageName
                           highlightSuffix:(nullable NSString *)highlightSuffix;

/// 实例化 UIButton
///
/// @param attributedText  attributedText
/// @param imageName       imageName
/// @param backImageName   backImageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)mj_buttonWithAttributedText:(nullable NSAttributedString *)attributedText
                                          imageName:(nullable NSString *)imageName
                                      backImageName:(nullable NSString *)backImageName
                                    highlightSuffix:(nullable NSString *)highlightSuffix;

// 多久后开始执行
- (void)mj_startTime:(NSInteger)timeout waitBlock:(void(^_Nullable)(NSInteger remainTime))waitBlock finishBlock:(void(^_Nonnull)())finishBlock;


@end
