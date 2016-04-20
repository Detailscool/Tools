//
//  NSString+StringSizeFit.m
//
//  Created by Detailscool on 15/12/25.
//  Copyright © 2015年 Detailscool. All rights reserved.
//

#import "NSString+StringSizeFit.h"

@implementation NSString (StringSizeFit)

- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary * dict = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font {
    NSDictionary * dict = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

@end
