//
//  UINavigationController+MJObjcSugar.m
//  Categories
//
//  Created by Michael 柏 on 2017/8/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "UINavigationController+MJObjcSugar.h"
#import <objc/runtime.h>

@interface MJFullScreenPopGestureRecognizerDelegate : NSObject <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation MJFullScreenPopGestureRecognizerDelegate
    
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
        
        // 判断是否是根控制器，如果是，取消手势
        if (self.navigationController.viewControllers.count <= 1) {
            return NO;
        }
        
        // 如果正在转场动画，取消手势
        if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
            return NO;
        }
        
        // 判断手指移动方向
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        if (translation.x <= 0) {
            return NO;
        }
        
        return YES;
}

@end

@implementation UINavigationController (MJObjcSugar)

+ (void)load {
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(mj_pushViewController:animated:));
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


- (void)mj_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.mj_popGestureRecognizer]) {
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.mj_popGestureRecognizer];
        
        NSArray *targets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget = [targets.firstObject valueForKey:@"target"];
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        
        self.mj_popGestureRecognizer.delegate = [self mj_fullScreenPopGestureRecognizerDelegate];
        [self.mj_popGestureRecognizer addTarget:internalTarget action:internalAction];
        
        // 禁用系统的交互手势
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    if (![self.viewControllers containsObject:viewController]) {
        [self mj_pushViewController:viewController animated:animated];
    }
}

- (MJFullScreenPopGestureRecognizerDelegate *)mj_fullScreenPopGestureRecognizerDelegate {
    MJFullScreenPopGestureRecognizerDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    if (!delegate) {
        delegate = [[MJFullScreenPopGestureRecognizerDelegate alloc] init];
        delegate.navigationController = self;
        
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return delegate;
}

- (UIPanGestureRecognizer *)mj_popGestureRecognizer {
    UIPanGestureRecognizer *panGestureRecognizer = objc_getAssociatedObject(self, _cmd);
    
    if (panGestureRecognizer == nil) {
        
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
        panGestureRecognizer.maximumNumberOfTouches = 1;
        
        objc_setAssociatedObject(self, _cmd, panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return panGestureRecognizer;
}

@end
