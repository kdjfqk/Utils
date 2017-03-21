//
//  LYLocationManager.m
//  LYFaultDiagnosis
//
//  Created by YNKJMACMINI2 on 16/1/18.
//  Copyright © 2016年 YNKJMACMINI2. All rights reserved.
//

#import "LocationManager.h"

@interface LocationManager()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation LocationManager
+(instancetype)sharedInstance
{
    static LocationManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LocationManager alloc] init];
    });
    return instance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        //定位服务是否可用
        BOOL enable = [CLLocationManager locationServicesEnabled];
        int status = [CLLocationManager authorizationStatus];
        if(!enable || status < 3){
            //请求权限
            [self.locationManager requestWhenInUseAuthorization];
        }
    }
    return self;
}

-(void)startUpdatingLocation
{
    [self.locationManager startUpdatingLocation];
}

-(void)stopUpdatingLocation
{
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status >= 3) {
        [self startUpdatingLocation];
    }
    else
    {
        [self stopUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D location = newLocation.coordinate;
    NSDictionary *info=[NSDictionary dictionaryWithObjects:@[[NSNumber numberWithDouble:location.latitude],[NSNumber numberWithDouble:location.longitude]] forKeys:@[@"latitude,longitude"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:kLocationChangedNotification object:self userInfo:info];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@",error.userInfo[NSLocalizedDescriptionKey]);
    [[NSNotificationCenter defaultCenter] postNotificationName:kLocationChangedNotification object:self userInfo:nil];
}

#pragma mark - get methods
-(CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 1000.0f;
    }
    return _locationManager;
}

@end
