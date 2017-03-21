//
//  DES.m
//  CodeLibrary
//
//  Created by ldy on 17/3/15.
//  Copyright © 2017年 YNKJMACMINI2. All rights reserved.
//

#import "DES.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@implementation DES
+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    NSData* cipherData = [GTMBase64 decodeString:cipherText];
    
    unsigned char buffer[102400];
    
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          102400,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}

+(NSString *)standerInformation:(NSString *)info needDefalutString:(BOOL)flag{
    
    if([info  isEqual:[NSNull null]] || [info isEqualToString:@""] || info == nil){
        if (flag) {
            return @"暂无";
        }else{
            return @"";
        }
        
    }else{
        return info;
    }
    
    return @"暂无";
}
@end
