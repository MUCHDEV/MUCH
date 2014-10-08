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
#import "WXApi.h"
@interface LoginViewController : UIViewController<TencentSessionDelegate,WeiboSDKDelegate,UITextFieldDelegate,WXApiDelegate>{
    TencentOAuth *tencentAuth;
    NSMutableArray*permissions;
    ANBlurredImageView *bgImageView;
    UIView *bgview;
    UITextField *_userNameTextField;
    UITextField *_passWordTextField;
    UITextField *_phoneTextField;
    UITextField *_yzmTextField;
    UITextField *_newPassWordTextField;
    UIView *contentview;//登录
    UIView *contentview2;//注册
    
    int flag;//0登录 1注册
}
@property (nonatomic,strong) NSString *wbtoken;
@property (nonatomic,weak)id<WXApiDelegate>delegate;
@end
