//
//  UIView+Extension.m
//
//  Created by Detailscool on 16/2/28.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY{
    return self.center.y;
}



- (BOOL)isShowingOnKeyWindow {
    
    // 转换坐标系后的frame 和 keywindow的frame 有交集
    if (CGRectIntersectsRect([self.superview convertRect:self.frame toView:[UIApplication sharedApplication].keyWindow], [UIApplication sharedApplication].keyWindow.frame)) {
        
        // 判断是否hidden,透明度是否大于0.01,window是否Keywindow
        if(self.hidden == NO && self.alpha > 0.01 && (self.window == [UIApplication sharedApplication].keyWindow)){
            return YES;
        }
    }
    
    return NO;
}


@end
