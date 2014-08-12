//
//  DetailContentTableViewCell.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "EGOImageView.h"
@interface DetailContentTableViewCell : UITableViewCell{
    int index;
    int arrIndex;
    EGOImageView *headimage;
    UILabel *content;
}

@property (nonatomic, strong) Message *messageModel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexRow:(int)indexRow arrCount:(int)arrCount;
@end
