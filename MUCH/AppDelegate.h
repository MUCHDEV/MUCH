//
//  AppDelegate.h
//  MUCH
//
//  Created by 汪洋 on 14-8-8.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "WXApi.h"
#import "BMapKit.h"
#import <CoreLocation/CoreLocation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate,CLLocationManagerDelegate,BMKGeneralDelegate,BMKLocationServiceDelegate,BMKMapViewDelegate>{
    BMKMapManager* _mapManager;
    BMKLocationService* _locService;
}
@property (nonatomic) CLLocationCoordinate2D coor;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginViewController *loginView;
+ (AppDelegate *)instance;
-(void)initLoginView;
@end
