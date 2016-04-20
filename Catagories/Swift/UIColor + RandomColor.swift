//
//  UIColor + RandomColor.swift
//
//  Created by Detailscool on 16/3/29.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func randomColor() -> UIColor {
        
        let r = CGFloat(random()%256) / 255.0
        let g = CGFloat(random()%256) / 255.0
        let b = CGFloat(random()%256) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
    }
    
}
