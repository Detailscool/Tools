//
//  UIImage+ClipImage.m
//
//  Created by Detailscool on 16/1/13.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "UIImage+ClipImage.h"

@implementation UIImage (ClipImage)

- (instancetype)clipImageWithArea:(CGRect)clipArea Scale:(CGFloat)scale {
    
    CGFloat clipX = clipArea.origin.x>self.size.width*scale?0:clipArea.origin.x;
    CGFloat clipY = clipArea.origin.y>self.size.height*scale?0:clipArea.origin.y;
    CGFloat clipW = clipX+clipArea.size.width>self.size.width*scale?self.size.width*scale-clipX:clipArea.size.width;
    CGFloat clipH = clipY+clipArea.size.height>self.size.height*scale?self.size.height*scale-clipY:clipArea.size.height;
    CGFloat clipSize = MIN(clipW, clipH);
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(clipSize, clipSize), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //小圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, clipSize, clipSize));
    
    CGContextClip(ctx);
    
//    [self drawInRect: CGRectMake(-clipX-(clipW - clipSize)*0.5,-clipY-(clipH - clipSize)*0.5,clipSize,clipSize)];
    [self drawInRect: CGRectMake(-clipX,-clipY,clipSize,clipSize)];
    
    CGContextFillPath(ctx);
    
    //从位图上下文获得图形上下文
    UIImage * newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭位图上下文
    UIGraphicsEndImageContext();
    
    return newimage;
    
}

- (instancetype)clipImageWithArea:(CGRect)clipArea Scale:(CGFloat)scale borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    
    CGFloat clipX = clipArea.origin.x>self.size.width*scale?0:clipArea.origin.x;
    CGFloat clipY = clipArea.origin.y>self.size.height*scale?0:clipArea.origin.y;
    CGFloat clipW = clipX+clipArea.size.width>self.size.width*scale?self.size.width*scale-clipX:clipArea.size.width;
    CGFloat clipH = clipY+clipArea.size.height>self.size.height*scale?self.size.height*scale-clipY:clipArea.size.height;
    
    CGFloat clipSize = MIN(clipW, clipH);
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(clipSize+borderWidth, clipSize+borderWidth), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //大圆
    [borderColor set];
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, clipSize+borderWidth, clipSize+borderWidth));
    CGContextFillPath(ctx);
    
    //小圆
    CGContextAddEllipseInRect(ctx, CGRectMake(borderWidth*0.5, borderWidth*0.5, clipSize, clipSize));
    
    CGContextClip(ctx);
    
//    [self drawInRect: CGRectMake(-clipX-(clipW - clipSize)*0.5,-clipY-(clipH - clipSize)*0.5,clipSize+borderWidth,clipSize+borderWidth)];
    
    [self drawInRect: CGRectMake(-clipX,-clipY,clipSize+borderWidth,clipSize+borderWidth)];
    
    CGContextFillPath(ctx);
    
    //从位图上下文获得图形上下文
    UIImage * newimage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭位图上下文
    UIGraphicsEndImageContext();
    
    return newimage;
    
}


- (instancetype)clipImage {
    return [self clipImageWithArea:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT) Scale:1];
}

- (instancetype)clipImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    return [self clipImageWithArea:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT) Scale:1 borderWidth:borderWidth borderColor:borderColor];
}

@end
