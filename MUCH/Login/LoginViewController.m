//
//  LoginViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "RegisterEvent.h"
#import "ConnectionAvailable.h"
#import "MBProgressHUD.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGBCOLOR(255, 229, 52)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(56.75, 90, 413/2, 232/2)];
    [imageView setImage:[UIImage imageNamed:@"字_03.png"]];
    [self.view addSubview:imageView];
    
    UIButton *wenxinbtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [wenxinbtn setImage:[UIImage imageNamed:@"09_03.png"] forState:UIControlStateNormal];
    wenxinbtn.frame = CGRectMake(20, 380, 554/2, 41);
    [wenxinbtn addTarget:self action:@selector(wenxinbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wenxinbtn];
    
    UIButton *weibobtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [weibobtn setImage:[UIImage imageNamed:@"09_06.png"] forState:UIControlStateNormal];
    weibobtn.frame = CGRectMake(20, 430, 268/2, 83/2);
    [weibobtn addTarget:self action:@selector(weibobtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weibobtn];
    
    UIButton *qqbtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [qqbtn setImage:[UIImage imageNamed:@"09_08.png"] forState:UIControlStateNormal];
    qqbtn.frame = CGRectMake(163, 430, 268/2, 83/2);
    [qqbtn addTarget:self action:@selector(qqbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qqbtn];
    
    UIButton *registerbtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    registerbtn.frame = CGRectMake(20, 480, 120, 30);
    [registerbtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [registerbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    registerbtn.titleLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    registerbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [registerbtn addTarget:self action:@selector(registerbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerbtn];
    
    UIButton *loginbtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    loginbtn.frame = CGRectMake(270, 480, 120, 30);
    [loginbtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginbtn.titleLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    loginbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [loginbtn addTarget:self action:@selector(loginbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginbtn];
    
    NSString *appid = @"222222";
    
    
	tencentAuth = [[TencentOAuth alloc] initWithAppId:appid
                                          andDelegate:self];
    
    permissions = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:
                                                         kOPEN_PERMISSION_GET_USER_INFO,
                                                         kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                                                         kOPEN_PERMISSION_ADD_ALBUM,
                                                         kOPEN_PERMISSION_ADD_IDOL,
                                                         kOPEN_PERMISSION_ADD_ONE_BLOG,
                                                         kOPEN_PERMISSION_ADD_PIC_T,
                                                         kOPEN_PERMISSION_ADD_SHARE,
                                                         kOPEN_PERMISSION_ADD_TOPIC,
                                                         kOPEN_PERMISSION_CHECK_PAGE_FANS,
                                                         kOPEN_PERMISSION_DEL_IDOL,
                                                         kOPEN_PERMISSION_DEL_T,
                                                         kOPEN_PERMISSION_GET_FANSLIST,
                                                         kOPEN_PERMISSION_GET_IDOLLIST,
                                                         kOPEN_PERMISSION_GET_INFO,
                                                         kOPEN_PERMISSION_GET_OTHER_INFO,
                                                         kOPEN_PERMISSION_GET_REPOST_LIST,
                                                         kOPEN_PERMISSION_LIST_ALBUM,
                                                         kOPEN_PERMISSION_UPLOAD_PIC,
                                                         kOPEN_PERMISSION_GET_VIP_INFO,
                                                         kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                                                         kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                                                         kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                                                         nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//微信
-(void)wenxinbtnClick{
    NSLog(@"wenxinbtnClick");
}

//微博
-(void)weibobtnClick{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

//qq
-(void)qqbtnClick{
    [tencentAuth authorize:permissions inSafari:NO];
}

-(void)registerbtnClick{
    flag = 1;
    [self setBackGroundView];
}

-(void)loginbtnClick{
    flag = 0;
    [self setBackGroundView];
}

-(void)gotologinClick{
    [UIView animateWithDuration:0.3 animations:^{
        contentview2.frame=CGRectMake(320, 347/2-91/2, 549/2, 215);
    }];
    if(contentview == nil){
        contentview = [[UIView alloc] initWithFrame:CGRectMake(-(549/2), 347/2-91/2, 549/2, 170)];
        [self setLoginView];
        [UIView animateWithDuration:0.3 animations:^{
            contentview.frame=CGRectMake(22.75, 347/2-91/2, 549/2, 170);
        }];
        
        [bgview addSubview:contentview];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            contentview.frame=CGRectMake(22.75, 347/2-91/2, 549/2, 170);
        }];
    }
}

-(void)registerClick{
    [UIView animateWithDuration:0.3 animations:^{
        contentview.frame=CGRectMake(-(549/2), 347/2-91/2, 549/2, 170);
    }];
    
    if(contentview2 == nil){
        contentview2 = [[UIView alloc] initWithFrame:CGRectMake(320, 347/2-91/2, 549/2, 215)];
        [self setRegisterView];
        [UIView animateWithDuration:0.3 animations:^{
            contentview2.frame=CGRectMake(22.75, 347/2-91/2, 549/2, 215);
        }];
        
        [bgview addSubview:contentview2];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            contentview2.frame=CGRectMake(22.75, 347/2-91/2, 549/2, 215);
        }];
    }
}

-(void)removebtnClick{
    [bgview removeFromSuperview];
    bgview = nil;
    [contentview removeFromSuperview];
    contentview = nil;
    [contentview2 removeFromSuperview];
    contentview2 = nil;
}

-(void)beginRecoginzer{
    [bgImageView blurInAnimationWithDuration:0.25f];
    [_userNameTextField becomeFirstResponder];
    contentview = [[UIView alloc] initWithFrame:CGRectMake(22.75, -100, 549/2, 170)];
    
    [self setLoginView];
    
    [UIView animateWithDuration:0.3 animations:^{
        contentview.frame=CGRectMake(22.75, 347/2-91/2, 549/2, 170);
    }];
    
    [bgview addSubview:contentview];
}

-(void)beginRecoginzer2{
    [bgImageView blurInAnimationWithDuration:0.25f];
    contentview2 = [[UIView alloc] initWithFrame:CGRectMake(22.75, -100, 549/2, 215)];
    [self setRegisterView];
    [UIView animateWithDuration:0.3 animations:^{
        contentview2.frame=CGRectMake(22.75, 347/2-91/2, 549/2, 215);
    }];
    
    [bgview addSubview:contentview2];
}

-(void)restPassWordClick{
    NSLog(@"restPassWordClick");
}

-(void)loginClick{
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:1];
    }else{
        [RegisterEvent LoginWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                NSLog(@"posts ==> %@",posts);
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:posts[0][@"id"] forKey:@"id"];
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"nickname"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                NSLog(@"%@",error);
                NSHTTPURLResponse* httpResponse = error.userInfo[@"AFNetworkingOperationFailingURLResponseErrorKey"];
                int responseStatusCode = [httpResponse statusCode];
                NSLog(@"%d",responseStatusCode);
            }
        } userName:_userNameTextField.text passWord:_passWordTextField.text];
    }
}

-(void)registeredClick{
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:1];
    }else{
        [RegisterEvent RegisterWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                NSLog(@"posts ==> %@",posts);
                [[NSUserDefaults standardUserDefaults] setObject:posts[0][@"avatar"] forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:posts[0][@"id"] forKey:@"id"];
                [[NSUserDefaults standardUserDefaults] setObject:posts[0][@"nickname"] forKey:@"nickname"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        } userName:_phoneTextField.text passWord:_newPassWordTextField.text passwordConfirmation:_newPassWordTextField.text];
    }
}



-(void)setBackGroundView{
    UIGraphicsBeginImageContext(self.view.frame.size); //currentView 当前的view
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    bgview = [[UIView alloc] initWithFrame:self.view.frame];
    bgImageView = [[ANBlurredImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    bgImageView.image = viewImage;
    [bgImageView setFramesCount:20];
    [bgImageView setBlurAmount:0.4];
    [bgview addSubview:bgImageView];
    
    UIImageView *blackimage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [blackimage setBackgroundColor:[UIColor blackColor]];
    blackimage.alpha = 0.5;
    [bgview addSubview:blackimage];
    [self.view addSubview:bgview];
    
    UIButton *removebtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    removebtn.frame = CGRectMake(280, 40, 20, 20);
    [removebtn setBackgroundImage:[UIImage imageNamed:@"09-2_03.png"] forState:UIControlStateNormal];
    [removebtn addTarget:self action:@selector(removebtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:removebtn];
    
    if(flag ==0){
        [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector: @selector(beginRecoginzer)  userInfo:nil repeats:NO];
    }else{
        [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector: @selector(beginRecoginzer2)  userInfo:nil repeats:NO];
    }
}

-(void)setLoginView{
    UIButton *restPassWord =  [UIButton buttonWithType:UIButtonTypeCustom];
    restPassWord.frame = CGRectMake(0, 0, 100, 30);
    [restPassWord setTitle:@"忘记密码？" forState:UIControlStateNormal];
    restPassWord.titleLabel.font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:17];
    restPassWord.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [restPassWord addTarget:self action:@selector(restPassWordClick) forControlEvents:UIControlEventTouchUpInside];
    [contentview addSubview:restPassWord];
    
    UIButton *regist =  [UIButton buttonWithType:UIButtonTypeCustom];
    regist.frame = CGRectMake(170, 0, 100, 30);
    [regist setTitle:@"注册" forState:UIControlStateNormal];
    regist.titleLabel.font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:17];
    regist.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [regist addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [contentview addSubview:regist];
    
    UIImageView *bgimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 35, 549/2, 171/2)];
    [bgimage setImage:[UIImage imageNamed:@"091_03.png"]];
    [contentview addSubview:bgimage];
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(52,40,549/2-52,30)];
    _userNameTextField.delegate = self;
    _userNameTextField.textAlignment=NSTextAlignmentLeft;
    _userNameTextField.placeholder=@"请输入您的用户名";
    _userNameTextField.returnKeyType=UIReturnKeyDone;
    _userNameTextField.font =  [UIFont systemFontOfSize:15];
    [_userNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [contentview addSubview:_userNameTextField];
    
    _passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(52,80,549/2-52,30)];
    _passWordTextField.delegate = self;
    _passWordTextField.textAlignment=NSTextAlignmentLeft;
    _passWordTextField.placeholder=@"请输入密码";
    _passWordTextField.returnKeyType=UIReturnKeyDone;
    _passWordTextField.font =  [UIFont systemFontOfSize:15];
    _passWordTextField.secureTextEntry = YES;
    [_passWordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [contentview addSubview:_passWordTextField];
    
    [_userNameTextField becomeFirstResponder];
    
    UIButton *login =  [UIButton buttonWithType:UIButtonTypeCustom];
    login.frame = CGRectMake(0, 125, 549/2, 40);
    [login setBackgroundImage:[UIImage imageNamed:@"登陆_03.png"] forState:UIControlStateNormal];
    [login addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [contentview addSubview:login];
}

-(void)setRegisterView{
    UIImageView *bgimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 35, 552/2, 262/2)];
    [bgimage setImage:[UIImage imageNamed:@"09-2_032.png"]];
    [contentview2 addSubview:bgimage];
    
    UIButton *restPassWord =  [UIButton buttonWithType:UIButtonTypeCustom];
    restPassWord.frame = CGRectMake(0, 0, 100, 30);
    [restPassWord setTitle:@"忘记密码？" forState:UIControlStateNormal];
    restPassWord.titleLabel.font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:17];
    restPassWord.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [restPassWord addTarget:self action:@selector(restPassWordClick) forControlEvents:UIControlEventTouchUpInside];
    [contentview2 addSubview:restPassWord];
    
    UIButton *gotologin =  [UIButton buttonWithType:UIButtonTypeCustom];
    gotologin.frame = CGRectMake(170, 0, 100, 30);
    [gotologin setTitle:@"登录" forState:UIControlStateNormal];
    gotologin.titleLabel.font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:17];
    gotologin.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [gotologin addTarget:self action:@selector(gotologinClick) forControlEvents:UIControlEventTouchUpInside];
    [contentview2 addSubview:gotologin];
    
    UIButton *registered =  [UIButton buttonWithType:UIButtonTypeCustom];
    registered.frame = CGRectMake(0, 172, 552/2, 40);
    [registered setBackgroundImage:[UIImage imageNamed:@"注册_03.png"] forState:UIControlStateNormal];
    [registered addTarget:self action:@selector(registeredClick) forControlEvents:UIControlEventTouchUpInside];
    [contentview2 addSubview:registered];
    
    _phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(50,40,549/2-140,30)];
    _phoneTextField.delegate = self;
    _phoneTextField.textAlignment=NSTextAlignmentLeft;
    _phoneTextField.placeholder=@"请输入手机号码";
    _phoneTextField.returnKeyType=UIReturnKeyDone;
    _phoneTextField.font =  [UIFont systemFontOfSize:15];
    [_phoneTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [contentview2 addSubview:_phoneTextField];
    
    _yzmTextField = [[UITextField alloc] initWithFrame:CGRectMake(50,85,549/2-52,30)];
    _yzmTextField.delegate = self;
    _yzmTextField.textAlignment=NSTextAlignmentLeft;
    _yzmTextField.placeholder=@"请输入验证码";
    _yzmTextField.returnKeyType=UIReturnKeyDone;
    _yzmTextField.font =  [UIFont systemFontOfSize:15];
    [_yzmTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [contentview2 addSubview:_yzmTextField];
    
    _newPassWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(50,125,549/2-52,30)];
    _newPassWordTextField.delegate = self;
    _newPassWordTextField.textAlignment=NSTextAlignmentLeft;
    _newPassWordTextField.placeholder=@"请输入密码";
    _newPassWordTextField.returnKeyType=UIReturnKeyDone;
    _newPassWordTextField.font =  [UIFont systemFontOfSize:15];
    [_newPassWordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [contentview2 addSubview:_newPassWordTextField];
    
    [_phoneTextField becomeFirstResponder];
}


//qq登录成功
- (void)tencentDidLogin {
	// 登录成功
    NSLog(@"登录成功");
    [self getMessage];
}

- (void)tencentDidNotLogin:(BOOL)cancelled
{
    if(cancelled){
        NSLog(@"用户取消");
    }else{
        NSLog(@"登录失败");
    }
}

/**
 * Called when the notNewWork.
 */
-(void)tencentDidNotNetWork
{
	NSLog(@"没有网络");
}

-(void)getMessage
{
    if(![tencentAuth getUserInfo]){
        [self showInvalidTokenOrOpenIDMessage];
    }
}

- (void)showInvalidTokenOrOpenIDMessage{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"api调用失败" message:@"可能授权已过期，请重新获取" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}


//qq获取详情
- (void)getUserInfoResponse:(APIResponse*) response {
	if (response.retCode == URLREQUEST_SUCCEED)
	{
        NSLog(@"userInfo%@",response.jsonResponse);
        NSLog(@"nickName%@",[response.jsonResponse objectForKey:@"nickname"]);
		NSMutableString *str=[NSMutableString stringWithFormat:@""];
		for (id key in response.jsonResponse) {
            
			[str appendString: [NSString stringWithFormat:@"%@:%@\n",key,[response.jsonResponse objectForKey:key]]];
		}
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作成功" message:[NSString stringWithFormat:@"%@",str]
							  
													   delegate:self cancelButtonTitle:@"我知道啦" otherButtonTitles: nil];
		[alert show];
        
        
	}
	else
    {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作失败" message:[NSString stringWithFormat:@"%@", response.errorMsg]
							  
													   delegate:self cancelButtonTitle:@"我知道啦" otherButtonTitles: nil];
		[alert show];
        
	}
}


//sina回调
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    NSLog(@"%@",response);
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        NSString *title = @"发送结果";
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode, response.userInfo, response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        NSString *title = @"认证结果";
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        
        self.wbtoken = [(WBAuthorizeResponse *)response accessToken];
        
        [alert show];
        
    }
}


- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{

}
@end
