//
//  LYLocationManager.h
//  LYFaultDiagnosis
//
//  Created by YNKJMACMINI2 on 16/1/18.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define kLocationChangedNotification @"LocationChangedNotification"

@interface LocationManager : NSObject<CLLocationManagerDelegate>

+(instancetype)sharedInstance;

-(void)startUpdatingLocation;
-(void)stopUpdatingLocation;

@end
