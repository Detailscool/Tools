//
//  UIColor+Extension.h
//
//  Created by Detailscool on 16/3/15.
//  Copyright © 2016年 GeniusBrother. All rights reserved.
//

#undef	RGB
#define RGB(R,G,B)		[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef	RGBA
#define RGBA(R,G,B,A)	[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#import <UIKit/UIKit.h>


@interface UIColor (Extension)

+ (UIColor *)colorForString:(NSString *)string;

@end
