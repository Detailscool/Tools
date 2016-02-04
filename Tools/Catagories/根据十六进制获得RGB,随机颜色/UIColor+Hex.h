//
//  UIColor+Hex.h
//  华图
//
//  Created by jsyh-mac on 15/6/17.
//  Copyright (c) 2015年 jsyh-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

+ (UIColor *)colorWithHexString:(NSString *)color ;

+ (UIColor *)randomColor;
@end
