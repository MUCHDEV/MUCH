//
//  HomePageDefaultTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageDefaultTableViewCell.h"

@implementation HomePageDefaultTableViewCell
@synthesize delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBackgroundColor:RGBCOLOR(217, 217, 217)];
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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(55, 50, 117/2, 117/2)];
    [imageView setImage:[UIImage imageNamed:@"03-2_03.png"]];
    [self.contentView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+5, 53, 160, 30)];
    label.text = @"附近没有合适的内容喔";
    label.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
    [self.contentView addSubview:label];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+5, 78, 160, 30)];
    label2.text = @"看更远的地方";
    label2.font = [UIFont fontWithName:@"GurmukhiMN" size:13];
    label2.textColor = [UIColor grayColor];
    [self.contentView addSubview:label2];
    
    UIImageView *btnImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 410, 555/2, 40)];
    [btnImage setImage:[UIImage imageNamed:@"03-2_11.png"]];
    UIImageView *addimage = [[UIImageView alloc] initWithFrame:CGRectMake(90, 10, 21.5, 21)];
    [addimage setImage:[UIImage imageNamed:@"03-2_07.png"]];
    [btnImage addSubview:addimage];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(120, 5, 80, 30)];
    label3.text = @"添加图片";
    label3.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
    [btnImage addSubview:label3];
    [self.contentView addSubview:btnImage];
    
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    btn.frame = CGRectMake(20, 410, 555/2, 40);
    [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
}

-(void)BtnClick{
    if([delegate respondsToSelector:@selector(addImage)]){
        [delegate addImage];
    }
}
@end
