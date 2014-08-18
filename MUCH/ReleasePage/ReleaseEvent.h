//
//  ReleaseEvent.h
//  MUCH
//
//  Created by 汪洋 on 14-8-14.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReleaseEvent : NSObject
@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSArray *comments;
@property (nonatomic, copy) NSDictionary *dict;


+ (NSURLSessionDataTask *)ReleaseWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block price:(NSString *)price imgStr:(NSString *)imgStr;
+ (NSURLSessionDataTask *)GetListWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block;
@end
