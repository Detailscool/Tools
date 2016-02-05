
//
//  UIImage+ClipImage.m
//  ImageContextTest
//
//  Created by Detailscool on 16/1/13.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "UIImage+ClipImage.h"

@implementation UIImage (ClipImage)

+ (instancetype)clipImageWithImageName:(NSString *)name andArea:(CGRect)clipArea andScale:(CGFloat)scale{
    
    UIImage *img = [UIImage imageNamed:name];
    
    CGFloat imgMin = MIN(img.size.height*scale, img.size.height*scale);
    
    CGFloat clipX = clipArea.origin.x>imgMin?0:clipArea.origin.x;
    CGFloat clipY = clipArea.origin.y>imgMin?0:clipArea.origin.y;
    CGFloat clipW = clipX+clipArea.size.width>imgMin?imgMin-clipX:clipArea.size.width;
    CGFloat clipH = clipY+clipArea.size.height>imgMin?imgMin-clipY:clipArea.size.height;
    
    CGFloat clipSize = MIN(clipW, clipH);
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(clipSize, clipSize), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //小圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, clipSize, clipSize));
    
    CGContextClip(ctx);
    
    [img drawInRect: CGRectMake(-clipX,-clipY,imgMin,imgMin)];
    
    CGContextFillPath(ctx);
    
    //从位图上下文获得图形上下文
    UIImage * newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭位图上下文
    UIGraphicsEndImageContext();
    
    
    return newImg;
    
}

+ (instancetype)clipImageWithImageName:(NSString *)name andArea:(CGRect)clipArea andScale:(CGFloat)scale withBorderWidth:(CGFloat)borderWidth andborderColor:(UIColor *)color{
    
    UIImage *img = [UIImage imageNamed:name];
    
    CGFloat imgMin = MIN(img.size.height*scale, img.size.height*scale);
    
    CGFloat clipX = clipArea.origin.x>imgMin?0:clipArea.origin.x;
    CGFloat clipY = clipArea.origin.y>imgMin?0:clipArea.origin.y;
    CGFloat clipW = clipX+clipArea.size.width>imgMin?imgMin-clipX:clipArea.size.width;
    CGFloat clipH = clipY+clipArea.size.height>imgMin?imgMin-clipY:clipArea.size.height;
    
    CGFloat clipSize = MIN(clipW, clipH);
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(clipSize+borderWidth, clipSize+borderWidth), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //大圆
    [color set];
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, clipSize+borderWidth, clipSize+borderWidth));
    CGContextFillPath(ctx);
    
    //小圆
    CGContextAddEllipseInRect(ctx, CGRectMake(borderWidth*0.5, borderWidth*0.5, clipSize, clipSize));
    
    CGContextClip(ctx);
    
    [img drawInRect: CGRectMake(-clipX,-clipY,imgMin+borderWidth,imgMin+borderWidth)];
    
    CGContextFillPath(ctx);
    
    //从位图上下文获得图形上下文
    UIImage * newImg = UIGraphicsGetImageFromCurrentImageContext();
    //关闭位图上下文
    UIGraphicsEndImageContext();
    
    return newImg;
    
}


+ (instancetype)clipImageWithImageName:(NSString *)name {
    return [self clipImageWithImageName:name andArea:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT) andScale:1];
}


@end
