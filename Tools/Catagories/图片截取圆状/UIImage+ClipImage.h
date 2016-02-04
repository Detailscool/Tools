//
//  UIImage+ClipImage.h
//  ImageContextTest
//
//  Created by Detailscool on 16/1/13.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ClipImage)

/**
 *  给定图片截圆图
 *
 *  @param name     图片的名字
 *  @param clipArea 需截取位于图片缩放后的区域
 *  @param scale    缩放比例
 *
 *  @return 截图后的图片
 */
+ (instancetype)clipImageWithImageName:(NSString *)name andArea:(CGRect)clipArea andScale:(CGFloat)scale;


/**
 *  给定给图截取圆图并且带有外框
 *
 *  @param name        图片名字
 *  @param clipArea    需截取位于图片缩放后的区域
 *  @param scale       缩放比例
 *  @param borderWidth 外边框宽度
 *  @param color       外边框颜色
 *
 *  @return 截图后的带边框的图片
 */
+ (instancetype)clipImageWithImageName:(NSString *)name andArea:(CGRect)clipArea andScale:(CGFloat)scale withBorderWidth:(CGFloat)borderWidth andborderColor:(UIColor *)color;
@end
