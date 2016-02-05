//
//  MBProgressHUD+LYH.h
//  UserLogin
//
//  Created by Detailscool on 16/2/5.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MBProgressHUD.m"

@interface MBProgressHUD (LYH)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;


@end
