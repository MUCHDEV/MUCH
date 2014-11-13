//
//  Message.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    
    MessageTypeMe = 0, // 自己发的
    MessageTypeOther = 1 //别人发得
    
} MessageType;
@interface Message : NSObject
@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSURL *iconURL;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) MessageType type;
@property (nonatomic, copy) NSDictionary *dict;

+ (NSURLSessionDataTask *)CommentsWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block arr:(NSMutableArray *)arr;

+ (NSURLSessionDataTask *)GetCommentsWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block aid:(NSString *)aid log:(NSString *)log lat:(NSString *)lat;

+ (NSURLSessionDataTask *)LikeWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block aid:(NSString *)aid;
@end
