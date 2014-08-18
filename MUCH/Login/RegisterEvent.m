//
//  RegisterEvent.m
//  MUCH
//
//  Created by 汪洋 on 14-8-14.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "RegisterEvent.h"
#import "AFAppDotNetAPIClient.h"
@implementation RegisterEvent
+ (NSURLSessionDataTask *)RegisterWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block userName:(NSString *)userName passWord:(NSString *)passWord passwordConfirmation:(NSString *)passwordConfirmation{
    NSString *urlStr = [NSString stringWithFormat:@"user/register"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    userName,@"username",
                                    passWord,@"password",
                                    passwordConfirmation,@"passwordConfirmation",
                                    nil];
    NSLog(@"parametersdata ===> %@",parametersdata);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parametersdata success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        [mutablePosts addObject:[JSON objectForKey:@"token"]];
        [mutablePosts addObject:[JSON objectForKey:@"id"]];
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

+ (NSURLSessionDataTask *)LoginWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block userName:(NSString *)userName passWord:(NSString *)passWord{
    NSString *urlStr = [NSString stringWithFormat:@"user/signin"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    userName,@"username",
                                    passWord,@"password",
                                    nil];
    NSLog(@"parametersdata ===> %@",parametersdata);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parametersdata success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        [mutablePosts addObject:[JSON objectForKey:@"token"]];
        [mutablePosts addObject:[JSON objectForKey:@"id"]];
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

+ (NSURLSessionDataTask *)UpdataWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic{
    NSString *urlStr = [NSString stringWithFormat:@"user/"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    dic[@"nick"],@"nickname",
                                    dic[@"sex"],@"gender",
                                    [[NSUserDefaults standardUserDefaults]objectForKey:@"id"],@"_id",
                                    nil];
    NSLog(@"parametersdata ===> %@",parametersdata);
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:parametersdata forKey:@"user"];
    return [[AFAppDotNetAPIClient sharedClient] PUT:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
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
@end
