//
//  NSString+Extension.m
//  LYFaultDiagnosis
//
//  Created by YNKJMACMINI2 on 15/11/20.
//  Copyright © 2015年 YNKJMACMINI2. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (URL)
-(NSString *)UrlEncodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self ,NULL ,CFSTR("!$&'()*+,-./:;=?@_~%#[]") ,kCFStringEncodingUTF8));
    return result;
}
@end


@implementation NSString (Size)
-(CGFloat)widthWithFont:(UIFont *)f
{
    NSDictionary *attribute = @{NSFontAttributeName:f};
    
    CGFloat stringWidth = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, f.lineHeight) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size.width;
    return stringWidth;
}
-(CGFloat)heightWithFont:(UIFont *)f maxWidth:(CGFloat)mWidth
{
    NSDictionary *attribute = @{NSFontAttributeName:f};
    CGFloat stringHeight = [self boundingRectWithSize:CGSizeMake(mWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size.height;
    return stringHeight;
}
@end

@implementation NSString (Date)
-(NSDate *)dataWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:self];
    return date;
}
@end
