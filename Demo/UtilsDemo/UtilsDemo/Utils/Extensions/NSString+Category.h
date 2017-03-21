//
//  NSString+Extension.h
//  LYFaultDiagnosis
//
//  Created by YNKJMACMINI2 on 15/11/20.
//  Copyright © 2015年 YNKJMACMINI2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (URL)
- (NSString *)UrlEncodedString;
@end

@interface NSString (Size)
//获取在特定字体下，单行显示该字符串所需要的宽度
-(CGFloat)widthWithFont:(UIFont *)f;
//获取在特定字体、特定宽度下，多行显示该字符串所需要的高度
-(CGFloat)heightWithFont:(UIFont *)f maxWidth:(CGFloat)mWidth;
@end


//时间格式 字符串
#define kDateFormatString1 @"yyyy-MM-dd HH:mm:ss"
#define kDateFormatString2 @"yyyy-MM-dd a HH:mm:ss"
#define kDateFormatString3 @"yyyy-MM-dd a HH:mm:ss EEEE"
//.....
@interface NSString (Date)
//将NSString类型的时间 根据格式字符串 转换为NSDate类型
+(NSDate *)dataWithFormat:(NSString *)format;
@end
