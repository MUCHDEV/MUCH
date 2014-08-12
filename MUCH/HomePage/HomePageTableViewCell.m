//
//  HomePageTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-9.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageTableViewCell.h"

@implementation HomePageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
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
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 1, 120)];
    [lineImageView setBackgroundColor:RGBCOLOR(203, 203, 203)];
    [self addSubview:lineImageView];
    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 47.5, 47.5)];
    [headView setImage:[UIImage imageNamed:@"06_11.png"]];
    [self addSubview:headView];
    
    UIImageView *dianView = [[UIImageView alloc] initWithFrame:CGRectMake(7.3, 83, 6.5, 6.5)];
    [dianView setImage:[UIImage imageNamed:@"03-1_12.png"]];
    [self addSubview:dianView];
    
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(55, 10, 260, 106.5)];
    [contentView setImage:[UIImage imageNamed:@"03-1_34.png"]];
    [self addSubview:contentView];
    
    namelabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 52.5, 100, 30)];
    namelabel.text = @"Alice";
    namelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    namelabel.textColor = [UIColor blueColor];
    [self addSubview:namelabel];
    
    distancelabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 72, 100, 30)];
    distancelabel.text = @"120m";
    distancelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    distancelabel.textColor = [UIColor grayColor];
    [self addSubview:distancelabel];
    
    contentNamelabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 10, 30, 30)];
    contentNamelabel.text = @"Alice";
    contentNamelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    contentNamelabel.textColor = [UIColor blueColor];
    [self addSubview:contentNamelabel];
    
    contentlabel = [[UILabel alloc] initWithFrame:CGRectMake(contentNamelabel.frame.size.width+contentNamelabel.frame.origin.x+5, 10, 120, 30)];
    contentlabel.text = @"我的东西很便宜的";
    contentlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self addSubview:contentlabel];
    
    contentNamelabel2 = [[UILabel alloc] initWithFrame:CGRectMake(75, 30, 40, 30)];
    contentNamelabel2.text = @"google";
    contentNamelabel2.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self addSubview:contentNamelabel2];
    
    contentlabel2 = [[UILabel alloc] initWithFrame:CGRectMake(contentNamelabel2.frame.size.width+contentNamelabel2.frame.origin.x+5, 30, 120, 30)];
    contentlabel2.text = @"有多便宜";
    contentlabel2.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self addSubview:contentlabel2];
    
    contentNamelabel3 = [[UILabel alloc] initWithFrame:CGRectMake(75, 53, 20, 30)];
    contentNamelabel3.text = @"kiki";
    contentNamelabel3.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self addSubview:contentNamelabel3];
    
    contentlabel3 = [[UILabel alloc] initWithFrame:CGRectMake(contentNamelabel3.frame.size.width+contentNamelabel3.frame.origin.x+5, 53, 120, 30)];
    contentlabel3.text = @"我用东西跟你换可";
    contentlabel3.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self addSubview:contentlabel3];
    
    UIImageView *moreImageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 80, 9, 2)];
    [moreImageView setImage:[UIImage imageNamed:@"03-1_24.png"]];
    [self addSubview:moreImageView];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(75, 87, 130, 1)];
    [lineImage setBackgroundColor:[UIColor blackColor]];
    [self addSubview:lineImage];
    lineImage.alpha = 0.2;
    
    pricelabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 87, 100, 30)];
    pricelabel.text = @"￥ 12.00";
    pricelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    pricelabel.textColor = RGBCOLOR(237, 100, 162);
    [self addSubview:pricelabel];
    
    goodImage = [[UIImageView alloc] initWithFrame:CGRectMake(170, 97, 10, 8.5)];
    [goodImage setImage:[UIImage imageNamed:@"03-1_17.png"]];
    [self addSubview:goodImage];
    
    goodlabel = [[UILabel alloc] initWithFrame:CGRectMake(185, 86, 100, 30)];
    goodlabel.text = @"869";
    goodlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    goodlabel.textColor = [UIColor grayColor];
    [self addSubview:goodlabel];
    
    bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(210, 12, 100, 100)];
    [bigImage setImage:[UIImage imageNamed:@"nature.jpg"]];
    [self addSubview:bigImage];
}
@end
