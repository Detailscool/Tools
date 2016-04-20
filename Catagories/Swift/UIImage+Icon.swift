//
//  UIImage+Icon.swift
//
//  Created by Detailscool on 16/3/20.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func creatQRCodeWithIconImage(icon:UIImage) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        
        self.drawInRect(CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let factor : CGFloat = 0.2
        let iconWidth : CGFloat = factor * self.size.width
        let iconHeight : CGFloat = factor * self.size.height
        let iconX : CGFloat = (1 - factor)*0.5*self.size.width
        let iconY : CGFloat = (1 - factor)*0.5*self.size.height
        
        icon.drawInRect(CGRect(x: iconX, y: iconY, width: iconWidth, height: iconHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
}