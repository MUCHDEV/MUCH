//
//  AppDelegate.m
//  MUCH
//
//  Created by 汪洋 on 14-8-8.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewController.h"
#import "LoginViewController.h"
#import "ScrollViewController.h"
@interface WBBaseRequest ()
- (void)debugPrint;
@end

@interface WBBaseResponse ()
- (void)debugPrint;
@end

@implementation AppDelegate
+ (AppDelegate *)instance {
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    
    //向微信注册
    [WXApi registerApp:@"wx2fe5e9a05cc63f07"];
    self.loginView = [[LoginViewController alloc] init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSLog(@"第一次启动");
        ScrollViewController *scrollview = [[ScrollViewController alloc] init];
        [self.window setRootViewController:scrollview];
        [self.window makeKeyAndVisible];
    }else{
        NSLog(@"已经不是第一次启动了");
        HomePageViewController *homepage = [[HomePageViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homepage];
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    NSArray *arr = [[NSString stringWithFormat:@"%@",url] componentsSeparatedByString:@":"];
    if([arr[0] isEqualToString:@"wx2fe5e9a05cc63f07"]){
        return [WXApi handleOpenURL:url delegate:self.loginView];
    }else{
        return [TencentOAuth HandleOpenURL:url];
    }
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    NSArray *arr = [[NSString stringWithFormat:@"%@",url] componentsSeparatedByString:@":"];
    if([arr[0] isEqualToString:@"wx2fe5e9a05cc63f07"]){
        return [WXApi handleOpenURL:url delegate:self.loginView];
    }else{
        return [TencentOAuth HandleOpenURL:url];
    }
}


@end
