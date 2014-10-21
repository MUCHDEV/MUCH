//
//  RegisterEvent.m
//  MUCH
//
//  Created by 汪洋 on 14-8-14.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "RegisterEvent.h"
#import "AFAppDotNetAPIClient.h"
#import "JSONKit.h"
@implementation RegisterEvent
- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    self.aid = dict[@"_id"];
    self.avatar = dict[@"avatar"];
    self.created = dict[@"created"];
    self.gender = dict[@"gender"];
    self.nickname = dict[@"nickname"];
    self.username = dict[@"username"];
}

+ (NSURLSessionDataTask *)RegisterWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block userName:(NSString *)userName passWord:(NSString *)passWord passwordConfirmation:(NSString *)passwordConfirmation avatar:(NSString *)avatar nickName:(NSString *)nickName{
    NSString *urlStr = [NSString stringWithFormat:@"user/register"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    userName,@"username",
                                    passWord,@"password",
                                    passwordConfirmation,@"passwordConfirmation",
                                    avatar,@"avatar",
                                    nickName,@"nickname",
                                    nil];
    NSLog(@"parametersdata ===> %@",parametersdata);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parametersdata success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
        if([[NSString stringWithFormat:@"%@",JSON[@"status"][@"code"]]isEqualToString:@"200"]){
            NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
            [mutablePosts addObject:JSON[@"result"]];
            if (block) {
                block([NSMutableArray arrayWithArray:mutablePosts], nil);
            }
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:JSON[@"status"][@"text"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"error ==> %@",error);
        if (block) {
            block([NSMutableArray array], error);
        }
    }];
}

+ (NSURLSessionDataTask *)LoginWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block userName:(NSString *)userName passWord:(NSString *)passWord{
    NSString *urlStr = [NSString stringWithFormat:@"user/signin"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    userName,@"username",
                                    passWord,@"password",
                                    nil];
    NSLog(@"parametersdata ===> %@",parametersdata);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parametersdata success:^(NSURLSessionDataTask * __unused task, id JSON) {
        //NSLog(@"JSON===>%@",JSON);
        if([[NSString stringWithFormat:@"%@",JSON[@"status"][@"code"]]isEqualToString:@"200"]){
            NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
            [mutablePosts addObject:JSON[@"result"]];
            if (block) {
                block([NSMutableArray arrayWithArray:mutablePosts], nil);
            }
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:JSON[@"status"][@"text"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSMutableArray array], error);
        }
    }];
}

+ (NSURLSessionDataTask *)UpdataWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block model:(RegisterEvent *)model{
    NSLog(@"%@",model.nickname);
    NSString *urlStr = [NSString stringWithFormat:@"user/"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    model.nickname,@"nickname",
                                    model.gender,@"gender",
                                    [[NSUserDefaults standardUserDefaults]objectForKey:@"id"],@"_id",
                                    nil];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:parametersdata forKey:@"user"];
    NSLog(@"parameters ===> %@",parameters);
    return [[AFAppDotNetAPIClient sharedClient] PUT:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        //NSLog(@"JSON===>%@",JSON);
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        
        if (block) {
            block([NSMutableArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"error ==> %@",error);
        if (block) {
            block([NSMutableArray array], error);
        }
    }];
}

+ (NSURLSessionDataTask *)UpdataHeadWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block imaStr:(NSString *)imaStr{
    NSString *urlStr = [NSString stringWithFormat:@"user/"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    imaStr,@"avatar",
                                    [[NSUserDefaults standardUserDefaults]objectForKey:@"id"],@"_id",
                                    nil];
    //NSLog(@"parametersdata ===> %@",parametersdata);
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:parametersdata forKey:@"user"];
    return [[AFAppDotNetAPIClient sharedClient] PUT:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        //NSLog(@"JSON===>%@",JSON);
        if([[NSString stringWithFormat:@"%@",JSON[@"status"][@"code"]]isEqualToString:@"200"]){
            NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
            [mutablePosts addObject:JSON[@"result"][@"avatar"]];
            if (block) {
                block([NSMutableArray arrayWithArray:mutablePosts], nil);
            }
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:JSON[@"status"][@"text"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"error ==> %@",error);
        if (block) {
            block([NSMutableArray array], error);
        }
    }];
}

+ (NSURLSessionDataTask *)GetUserWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block{
    NSString *urlStr = [NSString stringWithFormat:@"user/%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
    return [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        //NSLog(@"JSON===>%@",JSON);
        if([[NSString stringWithFormat:@"%@",JSON[@"status"][@"code"]]isEqualToString:@"200"]){
            NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
            RegisterEvent *model = [[RegisterEvent alloc] init];
            [model setDict:JSON[@"result"]];
            [mutablePosts addObject:model];
            if (block) {
                block([NSMutableArray arrayWithArray:mutablePosts], nil);
            }
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:JSON[@"status"][@"text"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"error ==> %@",error);
        if (block) {
            block([NSMutableArray array], error);
        }
    }];
}

+(void)GetWeiXin:(void (^)(NSDictionary *posts, NSError *error))block code:(NSString *)code{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx2fe5e9a05cc63f07&secret=03abac544342b22288ae0fdf5a05d630&code=%@&grant_type=authorization_code",code]];//创建URL
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];//通过URL创建网络请求
    [request setTimeoutInterval:30];//设置超时时间
    [request setHTTPMethod:@"GET"];//设置请求方式
    NSError *err;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    //NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *resultDict = [data objectFromJSONData];
    //NSLog(@"temp is :%@",resultDict);
    if(block){
        block([NSDictionary dictionaryWithDictionary:resultDict],nil);
    }
}

+ (void)GetWeiXinUser:(void (^)(NSDictionary *dic, NSError *error))block access_token:(NSString *)access_token{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=OPENID",access_token]];//创建URL
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];//通过URL创建网络请求
    [request setTimeoutInterval:30];//设置超时时间
    [request setHTTPMethod:@"GET"];//设置请求方式
    NSError *err;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    //NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *resultDict = [data objectFromJSONData];
    NSLog(@"temp is :%@",resultDict);
    if(block){
        block([NSDictionary dictionaryWithDictionary:resultDict],nil);
    }
}
@end
