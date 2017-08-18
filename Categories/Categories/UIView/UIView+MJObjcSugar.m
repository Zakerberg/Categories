//
//  UIView+MJObjcSugar.m
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "UIView+MJObjcSugar.h"

@implementation UIView (MJObjcSugar)
#pragma mark - Frame
- (CGPoint)mj_viewOrigin {
    return self.frame.origin;
}

- (void)setMj_viewOrigin:(CGPoint)mj_viewOrigin {
    CGRect newFrame = self.frame;
    newFrame.origin = mj_viewOrigin;
    self.frame = newFrame;
}

- (CGSize)mj_viewSize {
    return self.frame.size;
}

- (void)setMj_viewSize:(CGSize)mj_viewSize {
    CGRect newFrame = self.frame;
    newFrame.size = mj_viewSize;
    self.frame = newFrame;
}

#pragma mark - Frame Origin
- (CGFloat)mj_x {
    return self.frame.origin.x;
}

- (void)setMj_x:(CGFloat)mj_x {
    CGRect newFrame = self.frame;
    newFrame.origin.x = mj_x;
    self.frame = newFrame;
}

- (CGFloat)mj_y {
    return self.frame.origin.y;
}

- (void)setMj_y:(CGFloat)mj_y {
    CGRect newFrame = self.frame;
    newFrame.origin.y = mj_y;
    self.frame = newFrame;
}

#pragma mark - Frame Size
- (CGFloat)mj_width {
    return self.frame.size.width;
}

- (void)setMj_width:(CGFloat)mj_width {
    CGRect newFrame = self.frame;
    newFrame.size.width = mj_width;
    self.frame = newFrame;
}

- (CGFloat)mj_height {
    return self.frame.size.height;
}

- (void)setMj_height:(CGFloat)mj_height {
    CGRect newFrame = self.frame;
    newFrame.size.height = mj_height;
    self.frame = newFrame;
}

///截屏
- (UIImage *)mj_capturedImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    UIImage *result = nil;
    if ([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]) {
        result = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    return result;
}


@end
