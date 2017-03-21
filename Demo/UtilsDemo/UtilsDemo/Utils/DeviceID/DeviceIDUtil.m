//
//  LYGetDeviceID.m
//  LYFaultDiagnosis
//
//  Created by YNKJMACMINI4 on 15/10/12.
//  Copyright © 2015年 YNKJMACMINI2. All rights reserved.
//

#import "DeviceIDUtil.h"
#import "KeychainWrapper.h"

@implementation DeviceIDUtil

+(NSString *)getDeviceID
{
    KeychainWrapper * keychin=[[KeychainWrapper alloc] init];
    static NSString *deviceId;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceId=[keychin myObjectForKey:(id)kSecValueData];
        if (deviceId.length<=8) {
            deviceId=[self getUUID];
            //存到keychin中
            [keychin mySetObject:deviceId forKey:(id)kSecValueData];
        }
    });
    return deviceId;
}

//获取UUID
+(NSString *)getUUID{
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    NSString *guid = (__bridge NSString *)newUniqueIDString;
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    return([guid lowercaseString]);
}

@end
