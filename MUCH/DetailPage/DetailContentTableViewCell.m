//
//  DetailContentTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "DetailContentTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation DetailContentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexRow:(int)indexRow arrCount:(int)arrCount
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        index = indexRow-1;
        arrIndex = arrCount;
        [self setContent];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setContent{
    headView = [[UIImageView alloc] init];
    lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 109/2-1, 240, 1)];
    [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
    if(index == 1){
        [headView setFrame:CGRectMake(8.25, 0, 607/2, 109/2)];
        [headView setImage:[UIImage imageNamed:@"04_032.png"]];
        [headView addSubview:lineImage];
    }else if(index == arrIndex){
        [headView setFrame:CGRectMake(8.25, 0, 607/2, 98/2)];
        [headView setImage:[UIImage imageNamed:@"04_062.png"]];
    }else{
        [headView setFrame:CGRectMake(8.25, 0, 607/2, 98/2)];
        [headView setImage:[UIImage imageNamed:@"04_052.png"]];
        [headView addSubview:lineImage];
    }
    [self.contentView addSubview:headView];
    
    headimage = [[EGOImageView alloc] initWithFrame:CGRectMake(20, 20, 52/2, 51/2)];
    headimage.placeholderImage=[UIImage imageNamed:@"04_20.png"];
    headimage.layer.cornerRadius = 3;
    headimage.layer.masksToBounds = YES;
    [self.contentView addSubview:headimage];
    
    content =  [[UILabel alloc] initWithFrame:CGRectMake(60,10,240,40)];
    [content setNumberOfLines:2];
    content.textColor = [UIColor blackColor];
    content.textAlignment=NSTextAlignmentLeft;
    content.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self.contentView addSubview:content];
}

- (void)setMessageModel:(Message *)messageModel{
    headimage.imageURL = messageModel.iconURL;
    NSString* tempStr = [NSString stringWithFormat:@"%@:%@",messageModel.name,messageModel.content];
    NSMutableAttributedString* attStr=[[NSMutableAttributedString alloc]initWithString:tempStr];
    if(messageModel.type == MessageTypeMe){
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, messageModel.name.length)];
    }
    content.attributedText = attStr;
}

-(void)setNewBgView:(int)newIndex newArrCount:(int)newArrCount{
    if(lineImage == nil){
        lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 109/2-1, 240, 1)];
    }
    [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
    if(newIndex == 1){
        [headView setImage:[UIImage imageNamed:@"04_032.png"]];
        [headView addSubview:lineImage];
    }else if(newIndex == newArrCount){
        [headView setImage:[UIImage imageNamed:@"04_062.png"]];
    }else{
        [headView setImage:[UIImage imageNamed:@"04_052.png"]];
        [headView addSubview:lineImage];
    }
}
@end
