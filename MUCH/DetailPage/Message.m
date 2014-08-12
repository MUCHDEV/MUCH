//
//  Message.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "Message.h"

@implementation Message
- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    self.iconURL = dict[@"url"];
    self.name = dict[@"name"];
    self.content = dict[@"content"];
    self.type = [dict[@"type"] intValue];
}
@end
