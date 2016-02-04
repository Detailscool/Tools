//
//  NSString+Path.h
//  AppWithNSOperation
//
//  Created by Detailscool on 16/2/1.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)
/**
 *  拼接Document文件夹
 */
- (NSString *)appendDocumtent;
/**
 *  拼接Cache文件夹
 */
- (NSString *)appendCache;
/**
 *  拼接Tmp文件夹
 */
- (NSString *)appendTmp;


@end
