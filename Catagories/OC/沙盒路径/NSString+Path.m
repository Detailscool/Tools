//
//  NSString+Path.m
//
//  Created by Detailscool on 16/2/1.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)
/**
 *  拼接Document文件夹
 */
- (NSString *)appendDocumtent {
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[self lastPathComponent]];
}
/**
 *  拼接Cache文件夹
 */
- (NSString *)appendCache {
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[self lastPathComponent]];
}
/**
 *  拼接Tmp文件夹
 */
- (NSString *)appendTmp {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:[self lastPathComponent]];
}
@end
