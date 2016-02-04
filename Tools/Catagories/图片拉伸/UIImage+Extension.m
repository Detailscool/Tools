//
//  UIImage+Extension.m
//  02-QQ聊天-(掌握)
//
//  Created by gzxzmac on 15/12/25.
//  Copyright © 2015年 gzxzmac. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/**
 *  根据图片名称拉伸图片
 */
+ (instancetype)resizableImageWithName:(NSString *)imageName{
    // 普通状态下显示的图片
    UIImage *normalImage = [UIImage imageNamed:imageName];
    CGFloat leftCapWidth = normalImage.size.width * 0.5;
    CGFloat topCapHeight = normalImage.size.height * 0.5;
    return  [normalImage resizableImageWithCapInsets:UIEdgeInsetsMake(topCapHeight, leftCapWidth, topCapHeight, leftCapWidth) resizingMode:UIImageResizingModeStretch];
}
@end
