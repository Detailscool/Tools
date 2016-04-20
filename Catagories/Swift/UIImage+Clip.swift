//
//  UIImage+Clip.swift
//
//  Created by Detailscool on 16/3/22.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     *  给图以宽高最小为直径截取
     *
     *  @return 截取后图片
     */
    public func clipImage() -> UIImage {
        return clipImage((CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT))), scale:1.0)
    }
    
    
    /**
     *  给定图片截圆图
     *
     *  @param clipArea 需截取位于图片缩放后的区域
     *  @param scale    缩放比例
     *
     *  @return 截图后的图片
     */
    public func clipImage(clipArea:CGRect, scale:CGFloat) -> UIImage {
    
        let clipX = (clipArea.origin.x > self.size.width*scale) ? 0:clipArea.origin.x
        let clipY = clipArea.origin.y>self.size.height*scale ? 0:clipArea.origin.y
        let clipW = clipX+clipArea.size.width>self.size.width*scale ? self.size.width*scale-clipX : clipArea.size.width
        let clipH = clipY+clipArea.size.height>self.size.height*scale ? self.size.height*scale-clipY : clipArea.size.height
        let clipSize = min(clipW, clipH)
        
        //开启位图上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: clipSize, height: clipSize), false, 0.0)
        
        let ctx = UIGraphicsGetCurrentContext();
        
        //小圆
        CGContextAddEllipseInRect(ctx, CGRect(x: 0.0,y: 0.0,width: clipSize,height: clipSize));
        
        CGContextClip(ctx);
        
        drawInRect(CGRect(x: -clipX,y: -clipY,width: clipSize,height: clipSize))
        
        CGContextFillPath(ctx);
        
        //从位图上下文获得图形上下文
        let newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭位图上下文
        UIGraphicsEndImageContext();
        
        return newimage;
        
    }
    
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
    public func clipImageWithClipAreaAndBorder(clipArea:CGRect, scale:CGFloat,borderWidth:CGFloat,borderColor:UIColor) ->UIImage {
    
        
        let clipX = (clipArea.origin.x > self.size.width*scale) ? 0:clipArea.origin.x
        let clipY = clipArea.origin.y>self.size.height*scale ? 0:clipArea.origin.y
        let clipW = clipX+clipArea.size.width>self.size.width*scale ? self.size.width*scale-clipX : clipArea.size.width
        let clipH = clipY+clipArea.size.height>self.size.height*scale ? self.size.height*scale-clipY : clipArea.size.height
        let clipSize = min(clipW, clipH)
        
        //开启位图上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: clipSize + borderWidth, height: clipSize + borderWidth), false, 0.0)
        
        let ctx = UIGraphicsGetCurrentContext();
        
        //大圆
        borderColor.set();
        CGContextAddEllipseInRect(ctx, CGRect(x: 0.0,y: 0.0,width: clipSize + borderWidth,height: clipSize + borderWidth));
        CGContextFillPath(ctx);
        
        //小圆
        CGContextAddEllipseInRect(ctx, CGRect(x: borderWidth*0.5, y: borderWidth*0.5, width: clipSize, height: clipSize));
        CGContextClip(ctx);
        
        drawInRect(CGRect(x: -clipX,y: -clipY,width: clipSize + borderWidth,height: clipSize + borderWidth))
        
        CGContextFillPath(ctx);
        
        //从位图上下文获得图形上下文
        let newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭位图上下文
        UIGraphicsEndImageContext();
        
        return newimage;
        
    }
    
    /**
    *  给图以宽高最小为直径截取带外环效果
    *
    *  @param borderWidth 外边框宽度
    *  @param borderColor 外边框颜色
    *
    *  @return 截取后图片
    */
    public func clipImageBorder(borderWidth:CGFloat,borderColor:UIColor) -> UIImage {
        return clipImageWithClipAreaAndBorder(CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), scale:1.0 ,borderWidth:borderWidth,borderColor:borderColor)
    }
    
}