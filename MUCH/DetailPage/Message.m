//
//  Message.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "Message.h"
#import "AFAppDotNetAPIClient.h"
#import "PrintObject.h"
#import "RegisterEvent.h"
#import "LoginSqlite.h"
@implementation Message
- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    self.iconURL = dict[@"avatar"];
    self.name = dict[@"nickname"];
    self.content = dict[@"content"];
    self.type = [dict[@"type"] intValue];
    self.aid = dict[@"_id"];
}

+ (NSURLSessionDataTask *)CommentsWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block arr:(NSMutableArray *)arr{
    NSString *urlStr = [NSString stringWithFormat:@"/comment"];
    Message *model = arr[0];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:model.content,@"content",model.aid,@"postid",[LoginSqlite getdata:@"userId"],@"userid",nil];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:parametersdata forKey:@"comment"];
    NSLog(@"==>%@",parameters);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        //[mutablePosts addObject:[JSON objectForKey:@"token"]];
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

+ (NSURLSessionDataTask *)GetCommentsWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block aid:(NSString *)aid log:(NSString *)log lat:(NSString *)lat{
    NSString *urlStr = [NSString stringWithFormat:@"/post/%@?userid=%@&longitude=%@&latitude=%@",aid,[LoginSqlite getdata:@"userId"],log,lat];
    return [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
        if([[NSString stringWithFormat:@"%@",JSON[@"status"][@"code"]]isEqualToString:@"200"]){
            NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
            [mutablePosts addObject:JSON[@"result"][@"comments"]];
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

+ (NSURLSessionDataTask *)LikeWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block aid:(NSString *)aid{
    NSString *urlStr = [NSString stringWithFormat:@"/like"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:aid,@"postid",[LoginSqlite getdata:@"userId"],@"userid",nil];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:parametersdata forKey:@"like"];
    NSLog(@"==>%@",parameters);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
        if([[NSString stringWithFormat:@"%@",JSON[@"status"][@"code"]]isEqualToString:@"200"]){
            NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
            //[mutablePosts addObject:JSON[@"result"][@"comments"]];
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
@end
