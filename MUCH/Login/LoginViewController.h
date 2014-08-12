//
//  LoginViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "ANBlurredImageView.h"
@interface LoginViewController : UIViewController<TencentSessionDelegate,WeiboSDKDelegate,UITextFieldDelegate>{
    TencentOAuth *tencentAuth;
    NSMutableArray*permissions;
    ANBlurredImageView *bgImageView;
    UIView *bgview;
    UITextField *_userNameTextField;
    UITextField *_passWordTextField;
}
@property (nonatomic,strong) NSString *wbtoken;
@end
