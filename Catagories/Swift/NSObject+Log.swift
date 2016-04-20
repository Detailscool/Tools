//
//  NSObject+Log.swift
//
//  Created by Detailscool on 16/3/22.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

import UIKit
import ObjectiveC

extension NSObject {
    
    @nonobjc public class func initialize() {
        let method1 = class_getInstanceMethod(self.classForCoder(), NSSelectorFromString("description"))
        let method2 = class_getInstanceMethod(self.classForCoder(), NSSelectorFromString("yhDescription"))
        method_exchangeImplementations(method1, method2)
        
        print("\(method1)--\(method2)")
    }

    class func properties() -> [String] {
        
        var arr = [String]()
        
        var outCount: UInt32 = 0
        
        //获得属性数组
        let properties = class_copyPropertyList(self, &outCount)
        
        for i in 0..<Int(outCount) {
            //获得每一个属性
            let property = properties[i]
            //获得属性名字
            let cName = property_getName(property)
            
            let cAttributes = property_getAttributes(property)
            
            if let propertyName = String(CString: cName, encoding: NSUTF8StringEncoding) {
                
                let attributesName = String(CString: cAttributes, encoding: NSUTF8StringEncoding)
                
                arr.append(propertyName + ":" + attributesName!)
            }
            
        }          
        
        free(properties)
        
        return arr
    }
    
    class func ivars() -> [String] {
        
        var arr = [String]()
        
        var outCount: UInt32 = 0
        
        //获得属性数组
        let ivars = class_copyIvarList(self, &outCount)
        
        for i in 0..<Int(outCount) {
            //获得每一个属性
            let ivar = ivars[i]
            //获得属性名字
            let cName = ivar_getName(ivar)
            
            let cType = ivar_getTypeEncoding(ivar)
            
            if let ivarName = String(CString: cName, encoding: NSUTF8StringEncoding) {
                
                let typeName = String(CString: cType, encoding: NSUTF8StringEncoding)
                
                arr.append(ivarName + ":" + typeName!)
            }
            
        }
        
        free(ivars)
        
        return arr
    }
    
    func allPropertyNamesAndValues() ->[[String: AnyObject]] {
        
        var outCount: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &outCount)
        
        var resultDict = [[String: AnyObject]]()
        
        for i in 0..<Int(outCount) {
            
            var dict = [String : AnyObject]();
            
            let property = properties[i]
            
            // 取得属性名
            let cName = property_getName(property)
            if let propertyName = String(CString: cName, encoding: NSUTF8StringEncoding) {
                // 取得属性值
                if let propertyValue = self.valueForKey(propertyName) {
                    dict[propertyName] = propertyValue
                    
                    resultDict.append(dict)
                }
            }
        }
        
        return resultDict
    }
    
//    func yhDescription() -> String {
//        
//        let properties = allPropertyNamesAndValues();
//    
//        var des = String()
//        
//        for (key,value) in properties.enumerate() {
//            
//           let keyValue = "\(key):\(value)\n"
//            
//            des += keyValue
//            
//        }
//        
//        return des
//        
//    }

}


//extension Dictionary {
//    var description : String {
//    
//        return
//    }
//}
