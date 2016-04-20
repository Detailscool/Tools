//
//  String+Path.swift
//
//  Created by Detailscool on 16/3/21.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

import UIKit

extension String {
    
    func cache() -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! as NSString
        
        return path.stringByAppendingPathComponent(self as String)
        
    }
    
    func document() -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! as NSString
        
        return path.stringByAppendingPathComponent(self as String)
        
    }
    
    func tmp() -> String {
        
        let path = NSTemporaryDirectory() as NSString
        
        return path.stringByAppendingPathComponent(self as String)
        
    }
    
}
