//
//  NSDate+Extension.swift
//
//  Created by Detailscool on 16/3/23.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

import Foundation

extension NSDate {
    
    func stringFromDate(format:String = "yyyy-MM-dd HH:mm:ss" ) -> String {
        
        let dfm = NSDateFormatter()
        
        dfm.dateFormat = format
        
        dfm.locale = NSLocale(localeIdentifier: "en")
        
        return dfm.stringFromDate(self)
        
    }

    class func dateFromString(string:String, format:String = "yyyy-MM-dd HH:mm:ss") -> NSDate? {
    
        let dfm = NSDateFormatter()
    
        dfm.dateFormat = format
        
        dfm.locale = NSLocale(localeIdentifier: "en")
    
        return dfm.dateFromString(string)
    
    }

    func dateComponentsDateToNow() -> NSDateComponents {
    
        let unit = NSCalendarUnit(rawValue: UInt.max)
        
        return NSCalendar.currentCalendar().components(unit, fromDate: self, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0))
    }
    
    func isThisYear() -> Bool {
        
        let created_at = NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: self)
        let now = NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: NSDate())
        return created_at.year == now.year

    }
    
    func isToday() -> Bool {
        return NSCalendar.currentCalendar().isDateInToday(self)
    }

    func isYesterday() -> Bool {
        return NSCalendar.currentCalendar().isDateInYesterday(self)
    }

    
}

extension String {
    
    func timeStateForSocialNetwork(format:String = "yyyy-MM-dd HH:mm:ss") -> String {
        
        let createDate = NSDate.dateFromString(self , format: format)
        
        if let date = createDate {
            
            if date.isThisYear() {
                
                if date.isToday() {
                    
                    if date.dateComponentsDateToNow().hour > 1 {
                        // 1小时前
                        return "\(date.dateComponentsDateToNow().hour)小时前"
                        
                    }else if date.dateComponentsDateToNow().minute > 1 {
                        // 大于1分钟&1小时内
                        return "\(date.dateComponentsDateToNow().minute)分钟前"
                    }else {
                        // 1分钟内
                        return "刚刚";
                    }
                    
                }else if date.isYesterday() {
                    // 昨天
                    return "昨天 \(date.stringFromDate("HH:mm"))"
                    
                }else {
                    // 既不是今天也不是昨天
                    return "\(date.stringFromDate("MM-dd HH:mm"))"
                }
                
            }else {
                // 非今年 显示全日期
                return self
            }
            
        }
        
        return self
    }
    
}