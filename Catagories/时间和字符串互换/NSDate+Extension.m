//
//  NSDate+Extension.m
//  NTES_Lottery
//
//  Created by Detailscool on 16/1/22.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSString *)stringFromDateWithFormat:(NSString *)format {
    
    NSDateFormatter * dfm = [[NSDateFormatter alloc]init];
    
    dfm.dateFormat = format;
    
    return [dfm stringFromDate:self];
    
}

+ (instancetype)dateFromString:(NSString *)string andFormat:(NSString *)format {
    
    NSDateFormatter * dfm = [[NSDateFormatter alloc]init];
    
    dfm.dateFormat = format;
    
    return [dfm dateFromString:string];

}



@end
