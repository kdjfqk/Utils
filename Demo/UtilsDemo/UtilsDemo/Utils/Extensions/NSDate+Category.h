//
//  NSDate+Extension.h
//  CodeLibrary
//
//  Created by YNKJMACMINI2 on 16/1/12.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

#import <Foundation/Foundation.h>

//时间格式 字符串
#define kDateFormatString1 @"yyyy-MM-dd HH:mm:ss"
#define kDateFormatString2 @"yyyy-MM-dd a HH:mm:ss"
#define kDateFormatString3 @"yyyy-MM-dd a HH:mm:ss EEEE"
//.....

@interface NSDate (Extension)
//获取本地当前时间
+(NSDate *)getLocaleCurrentTime;
//将NSDate类型的时间 根据格式字符串 转换为NSString类型
-(NSString *)stringWithFormat:(NSString *)format;
@end
