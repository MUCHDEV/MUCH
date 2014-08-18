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
@implementation Message
- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    self.iconURL = dict[@"url"];
    self.name = dict[@"name"];
    self.content = dict[@"content"];
    self.type = [dict[@"type"] intValue];
    self.aid = dict[@"_id"];
}

+ (NSURLSessionDataTask *)CommentsWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block arr:(NSMutableArray *)arr{
    NSString *urlStr = [NSString stringWithFormat:@"/post"];
    NSMutableArray *dicArr = [[NSMutableArray alloc] init];
    for (int i=0; i<arr.count; i++) {
        Message *model = arr[i];
        NSDictionary *parametersdata = [[NSDictionary alloc] initWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],@"userid",model.content,@"content", nil];
        
        //NSLog(@"===>%@", [parametersdata JSONString]);
        [dicArr addObject:parametersdata];
    }
    Message *model = arr[0];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:model.aid forKey:@"_id"];
    [dic setObject:dicArr forKey:@"comments"];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:dic forKey:@"post"];
    NSLog(@"%@",parameters);
    return [[AFAppDotNetAPIClient sharedClient] PUT:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
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
@end
