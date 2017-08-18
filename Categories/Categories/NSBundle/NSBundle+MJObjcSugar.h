//
//  NSBundle+MJObjcSugar.h
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (MJObjcSugar)

/// 当前版本号字符串
+ (nullable NSString *) mj_currentVersion;

/// 与当前屏幕尺寸匹配的启动图像
+ (nullable UIImage *) mj_lunchImage;

@end
