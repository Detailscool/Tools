//
//  NSString+StringSizeFit.h
//
//  Created by Detailscool on 15/12/25.
//  Copyright © 2015年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (StringSizeFit)

- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

@end
