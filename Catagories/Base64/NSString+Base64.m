//
//  NSString+Base64.m
//
//  Created by Detailcool on 15/09/28
//  Copyright (c) 2015年 Detailcool. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

- (NSString *)base64encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64decode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)basicAuthString {
    return [@"BASIC " stringByAppendingString:self.base64encode];
}

@end
