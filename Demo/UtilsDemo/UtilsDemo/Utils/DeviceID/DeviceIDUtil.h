//
//  LYGetDeviceID.h
//  LYFaultDiagnosis
//
//  Created by YNKJMACMINI4 on 15/10/12.
//  Copyright © 2015年 YNKJMACMINI2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceIDUtil : NSObject
//从keychain中获取设备ID，如果keychain中不存在，则会生成一个，并存到keychain中，并返回
+(NSString *)getDeviceID;
@end
