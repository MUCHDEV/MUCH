//
//  RegisterEvent.h
//  MUCH
//
//  Created by 汪洋 on 14-8-14.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterEvent : NSObject
@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSDictionary *dict;
+ (NSURLSessionDataTask *)RegisterWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block userName:(NSString *)userName passWord:(NSString *)passWord passwordConfirmation:(NSString *)passwordConfirmation avatar:(NSString *)avatar nickName:(NSString *)nickName;

+ (NSURLSessionDataTask *)LoginWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block userName:(NSString *)userName passWord:(NSString *)passWord;

+ (NSURLSessionDataTask *)UpdataWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block model:(RegisterEvent *)model;
+ (NSURLSessionDataTask *)UpdataHeadWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block imaStr:(NSString *)imaStr;
+ (NSURLSessionDataTask *)GetUserWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block;

+ (NSDictionary *)GetWeiXin:(NSString *)code;
+ (NSDictionary *)GetWeiXinUser:(NSString *)access_token;
@end
