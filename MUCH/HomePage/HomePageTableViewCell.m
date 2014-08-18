//
//  HomePageTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-9.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageTableViewCell.h"
#import "GTMBase64.h"
@implementation HomePageTableViewCell
@synthesize bigImage;
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
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 1, 130)];
    [lineImageView setBackgroundColor:RGBCOLOR(203, 203, 203)];
    [self.contentView addSubview:lineImageView];
    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 47.5, 47.5)];
    [headView setImage:[UIImage imageNamed:@"06_11.png"]];
    [self.contentView addSubview:headView];
    
    UIImageView *dianView = [[UIImageView alloc] initWithFrame:CGRectMake(7.3, 83, 6.5, 6.5)];
    [dianView setImage:[UIImage imageNamed:@"03-1_12.png"]];
    [self.contentView addSubview:dianView];
    
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(55, 10, 260, 106.5)];
    [contentView setImage:[UIImage imageNamed:@"03-1_34.png"]];
    [self.contentView addSubview:contentView];
    
    namelabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 52.5, 100, 30)];
    namelabel.text = @"Alice";
    namelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    namelabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:namelabel];
    
    distancelabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 72, 100, 30)];
    distancelabel.text = @"120m";
    distancelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    distancelabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:distancelabel];
    
    
    UIImageView *moreImageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 80, 9, 2)];
    [moreImageView setImage:[UIImage imageNamed:@"03-1_24.png"]];
    [self.contentView addSubview:moreImageView];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(75, 87, 130, 1)];
    [lineImage setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:lineImage];
    lineImage.alpha = 0.2;
    
    pricelabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 87, 100, 30)];
    pricelabel.text = @"￥ 12.00";
    pricelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    pricelabel.textColor = RGBCOLOR(237, 100, 162);
    [self.contentView addSubview:pricelabel];
    
    goodImage = [[UIImageView alloc] initWithFrame:CGRectMake(170, 97, 10, 8.5)];
    [goodImage setImage:[UIImage imageNamed:@"03-1_17.png"]];
    [self.contentView addSubview:goodImage];
    
    goodlabel = [[UILabel alloc] initWithFrame:CGRectMake(185, 86, 100, 30)];
    goodlabel.text = @"869";
    goodlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    goodlabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:goodlabel];
    
    bigImage = [[EGOImageView alloc] initWithFrame:CGRectMake(210, 12, 100, 100)];
    bigImage.placeholderImage = [UIImage imageNamed:@"nature.jpg"];
    [self.contentView addSubview:bigImage];
}

-(void)setReleaseEvent:(ReleaseEvent *)releaseEvent{
    NSLog(@"%@",[releaseEvent.comments class]);
    pricelabel.text = [NSString stringWithFormat:@"￥ %@",releaseEvent.price];
    bigImage.imageURL = [NSURL URLWithString:releaseEvent.content];
    for(int i=0;i<releaseEvent.comments.count;i++){
        if(i%2==0){
            if(i<6){
                contentNamelabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 10*(i+1), 30, 30)];
                contentNamelabel.text = @"Alice";
                contentNamelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
                contentNamelabel.textColor = [UIColor blueColor];
                [self.contentView addSubview:contentNamelabel];
                
                contentlabel = [[UILabel alloc] initWithFrame:CGRectMake(contentNamelabel.frame.size.width+contentNamelabel.frame.origin.x+5, 10*(i+1), 100, 30)];
                contentlabel.text = releaseEvent.comments[i];
                contentlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
                [self.contentView addSubview:contentlabel];
            }
        }
    }
}
@end
