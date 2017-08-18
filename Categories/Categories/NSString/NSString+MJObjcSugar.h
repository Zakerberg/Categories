//
//  NSString+MJObjcSugar.h
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJObjcSugar) //Path

/// 拼接了`文档目录`的全路径
@property (nullable, nonatomic, readonly) NSString *mj_documentDirectory;
/// 拼接了`缓存目录`的全路径
@property (nullable, nonatomic, readonly) NSString *mj_cacheDirecotry;
/// 拼接了临时目录的全路径
@property (nullable, nonatomic, readonly) NSString *mj_tmpDirectory;

@end

@interface NSString (HMBase64)

/// BASE 64 编码的字符串内容
@property(nullable, nonatomic, readonly) NSString *mj_base64encode;
/// BASE 64 解码的字符串内容
@property(nullable, nonatomic, readonly) NSString *mj_base64decode;

@end
