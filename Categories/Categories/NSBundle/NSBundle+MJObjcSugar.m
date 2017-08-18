//
//  NSBundle+MJObjcSugar.m
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "NSBundle+MJObjcSugar.h"

@implementation NSBundle (MJObjcSugar)

+ (nullable NSString *) mj_currentVersion{
    
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

+ (nullable UIImage *) mj_lunchImage{
    
    NSArray *launchImages = [NSBundle mainBundle].infoDictionary[@"UILaunchImages"];
    
    NSString *sizeString = NSStringFromCGSize([UIScreen mainScreen].bounds.size);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"UILaunchImageOrientation = 'Portrait' AND UILaunchImageSize = %@", sizeString];
    NSArray *result = [launchImages filteredArrayUsingPredicate:predicate];
    
    NSString *imageName = result.lastObject[@"UILaunchImageName"];
    
    return [UIImage imageNamed:imageName];
    
}

@end
