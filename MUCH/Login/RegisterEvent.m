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
