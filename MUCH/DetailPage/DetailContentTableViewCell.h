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
    UIImageView *headView;
    UIImageView *lineImage;
}

@property (nonatomic, strong) Message *messageModel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexRow:(int)indexRow arrCount:(int)arrCount;
-(void)setNewBgView:(int)newIndex newArrCount:(int)newArrCount;
@end
