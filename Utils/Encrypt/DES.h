//
//  DES.h
//  CodeLibrary
//
//  Created by ldy on 17/3/15.
//  Copyright © 2017年 YNKJMACMINI2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES : NSObject

/************************************************************************************
 DES加密方法
 
 要求参数：加密字符串/加密密钥
 
 返回参数：加密后的字符串
 ************************************************************************************/
+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;


/************************************************************************************
 DES解密方法
 
 要求参数：加密后字符串/加密密钥
 
 返回参数：解密后的字符串
 ************************************************************************************/
+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key;

@end
