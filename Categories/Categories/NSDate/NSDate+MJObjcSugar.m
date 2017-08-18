//
//  NSDate+MJObjcSugar.m
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "NSDate+MJObjcSugar.h"

@implementation NSDate (MJObjcSugar)
#pragma mark - <日期方法>

+ (nonnull NSDateFormatter *)mj_sharedDateFormatter{
    
    static NSDateFormatter *dateFormatter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    });
    
    return dateFormatter;
}

+ (nonnull NSCalendar *)mj_sharedCalendar{
    
    static NSCalendar *calendar;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [NSCalendar currentCalendar];
    });
    
    return calendar;
}

#pragma mark - 日期方法
+ (NSString *)mj_dateStringWithDelta:(NSTimeInterval)delta {
    
    [self mj_sharedDateFormatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:delta];
    
    return [[self mj_sharedDateFormatter] stringFromDate:date];
}

- (NSString *)hm_dateDescription {
    
    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [[NSDate mj_sharedCalendar] components:units fromDate:self];
    NSDateComponents *thisComponents = [[NSDate mj_sharedCalendar] components:units fromDate:[NSDate date]];
    
    // 今天
    if (dateComponents.year == thisComponents.year
        && dateComponents.month == thisComponents.month
        && dateComponents.day == thisComponents.day) {
        
        NSInteger delta = (NSInteger)[[NSDate date] timeIntervalSinceDate:self];
        
        if (delta < 60) {
            return @"刚刚";
        }
        if (delta < 3600) {
            return [NSString stringWithFormat:@"%zd 分钟前", delta / 60];
        }
        return [NSString stringWithFormat:@"%zd 小时前", delta / 3600];
    }
    
    NSString *format = @"MM-dd HH:mm";
    
    if (dateComponents.year != thisComponents.year) {
        format = [@"yyyy-" stringByAppendingString:format];
    }
    [NSDate mj_sharedDateFormatter].dateFormat = format;
    
    return [[NSDate mj_sharedDateFormatter] stringFromDate:self];
}

@end
