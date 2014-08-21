//
//  ReleaseEvent.m
//  MUCH
//
//  Created by 汪洋 on 14-8-14.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "ReleaseEvent.h"
#import "AFAppDotNetAPIClient.h"
@implementation ReleaseEvent
- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    self.aid = dict[@"_id"];
    self.price = dict[@"title"];
    self.content = dict[@"content"];
    self.likes = dict[@"likes"];
    self.created = dict[@"created"];
    self.createdby = dict[@"createdby"];
    self.comments = dict[@"comments"];
}


+(NSURLSessionDataTask *)ReleaseWithBlock:(void (^)(NSMutableArray *, NSError *))block price:(NSString *)price imgStr:(NSString *)imgStr{
    NSString *urlStr = [NSString stringWithFormat:@"/post"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    price,@"title",
                                    imgStr,@"content",
                                    [[NSUserDefaults standardUserDefaults]objectForKey:@"id"],@"createdby",
                                    nil];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:parametersdata forKey:@"post"];
    NSLog(@"parametersdata ===> %@",parameters);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        //NSLog(@"JSON===>%@",JSON);
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        [mutablePosts addObject:[JSON objectForKey:@"status"]];
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


+ (NSURLSessionDataTask *)GetListWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block start:(int)start{
    NSString *urlStr = [NSString stringWithFormat:@"/post?offset=%d&size=5",start];
    return [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        //NSLog(@"JSON===>%@",JSON);
        if([[NSString stringWithFormat:@"%@",JSON[@"status"][@"code"]]isEqualToString:@"200"]){
            NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
            for(NSDictionary *item in JSON[@"result"]){
                //NSLog(@"%@",item[@"comments"][0]);
                ReleaseEvent *model = [[ReleaseEvent alloc] init];
                [model setDict:item];
                [mutablePosts addObject:model];
            }
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

+ (NSURLSessionDataTask *)GetMyListWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block aid:(NSString *)aid{
    NSString *urlStr = [NSString stringWithFormat:@"/owner?id=%@&groupby=date",aid];
    return [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
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
        NSLog(@"error ==> %@",error);
        if (block) {
            block([NSMutableArray array], error);
        }
    }];
}
@end
