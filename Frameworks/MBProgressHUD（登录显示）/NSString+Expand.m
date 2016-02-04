//
//  NSString+Expand.m
//  PrivateAddressbook
//
//  Created by Detailscool on 16/1/1.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "NSString+Expand.h"


@implementation NSString (Expand)

- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary * dict = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

@end
