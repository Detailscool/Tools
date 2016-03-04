//
//  UIImage+Extension.h
//
//  Created by gzxzmac on 15/12/25.
//  Copyright © 2015年 gzxzmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据图片名称拉伸图片
 */
+ (instancetype)resizableImageWithName:(NSString *)imageName;

@end
