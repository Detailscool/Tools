//
//  UIView+Extension.h
//
//  Created by Detailscool on 16/2/28.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat y;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGFloat centerX;
@property (nonatomic,assign)CGFloat centerY;

- (BOOL)isShowingOnKeyWindow;

@end
