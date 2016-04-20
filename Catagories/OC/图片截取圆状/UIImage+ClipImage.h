//
//  UIImage+ClipImage.h
//
//  Created by Detailscool on 16/1/13.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ClipImage)

/**
 *  给定图片截圆图
 *
 *  @param clipArea 需截取位于图片缩放后的区域
 *  @param scale    缩放比例
 *
 *  @return 截图后的图片
 */
- (instancetype)clipImageWithArea:(CGRect)clipArea scale:(CGFloat)scale;

/**
 *  给定给图截取圆图并且带有外框
 *
 *  @param clipArea    需截取位于图片缩放后的区域
 *  @param scale       缩放比例
 *  @param borderWidth 外边框宽度
 *  @param borderColor 外边框颜色
 *
 *  @return 截图后的带边框的图片
 */
- (instancetype)clipImageWithArea:(CGRect)clipArea scale:(CGFloat)scale borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  给图以宽高最小为直径截取
 *
 *  @param name 图片
 *
 *  @return 截取后图片
 */
- (instancetype)clipImage;

/**
 *  给图以宽高最小为直径截取带外环效果
 *
 *  @param name 图片
 *  @param borderWidth 外边框宽度
 *  @param borderColor 外边框颜色
 *
 *  @return 截取后图片
 */
- (instancetype)clipImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


@end
