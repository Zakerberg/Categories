//
//  NSDate+MJObjcSugar.h
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MJObjcSugar)

#pragma mark - <单例>
+ (nonnull NSDateFormatter *)mj_sharedDateFormatter;
+ (nonnull NSCalendar *)mj_sharedCalendar;

#pragma mark - <日期方法>

/// 返回指定时间差值的日期字符串
///
/// @param delta 时间差值
///
/// @return 日期字符串，格式：yyyy-MM-dd HH:mm:ss

+ (nonnull NSString *)mj_dateStringWithDelta:(NSTimeInterval)delta;

/// 返回日期格式字符串
///
/// 具体格式如下：
///     - 刚刚(一分钟内)
///     - X分钟前(一小时内)
///     - X小时前(当天)
///     - MM-dd HH:mm(一年内)
///     - yyyy-MM-dd HH:mm(更早期)

@property (nonnull, nonatomic, readonly) NSString *mj_dateDescription;

@end
