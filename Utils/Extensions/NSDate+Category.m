//
//  NSDate+Extension.m
//  CodeLibrary
//
//  Created by YNKJMACMINI2 on 16/1/12.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Extension)
+(NSDate *)getLocaleCurrentTime
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}

-(NSString *)stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[[NSTimeZone alloc] initWithName:@"GMT"]];
    [formatter setDateFormat:format];
    NSString *strDate = [formatter stringFromDate:self];
    return strDate;
}
@end
