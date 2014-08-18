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
    self.comments = dict[@"comments"];
}


+(NSURLSessionDataTask *)ReleaseWithBlock:(void (^)(NSMutableArray *, NSError *))block price:(NSString *)price imgStr:(NSString *)imgStr{
    NSString *urlStr = [NSString stringWithFormat:@"/post"];
    NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    price,@"title",
                                    imgStr,@"content",
                                    nil];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:parametersdata forKey:@"post"];
    NSLog(@"parametersdata ===> %@",parameters);
    return [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
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

+ (NSURLSessionDataTask *)GetListWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block{
    NSString *urlStr = [NSString stringWithFormat:@"/post"];
    return [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON===>%@",JSON);
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        for(NSDictionary *item in JSON){
           // NSLog(@"%@",[item[@"comments"] class]);
            ReleaseEvent *model = [[ReleaseEvent alloc] init];
            [model setDict:item];
            [mutablePosts addObject:model];
        }
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
