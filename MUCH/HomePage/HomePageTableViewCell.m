//
//  HomePageTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-9.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageTableViewCell.h"
#import "GTMBase64.h"
#import "EGOImageView.h"
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
    
    UIImageView *headBgImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 47.5, 47.5)];
    [headBgImage setImage:[UIImage imageNamed:@"03-1_30.png"]];
    [self.contentView addSubview:headBgImage];
    
    headView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"06_11副本.png"]];
    headView.frame = CGRectMake(5, 10, 47.5, 47.5);
    headView.layer.cornerRadius = 47.5/2;
    headView.layer.masksToBounds = YES;
    [self.contentView addSubview:headView];
    
    UIImageView *dianView = [[UIImageView alloc] initWithFrame:CGRectMake(12.3, 83, 6.5, 6.5)];
    [dianView setImage:[UIImage imageNamed:@"03-1_12.png"]];
    [self.contentView addSubview:dianView];
    
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(55, 10, 260, 106.5)];
    [contentView setImage:[UIImage imageNamed:@"03-1_34.png"]];
    [self.contentView addSubview:contentView];
    
    namelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 52.5, 100, 30)];
    namelabel.text = @"";
    namelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    namelabel.textColor = RGBCOLOR(50, 118, 243);
    [self.contentView addSubview:namelabel];
    
    distancelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 72, 100, 30)];
    distancelabel.text = @"";
    distancelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    distancelabel.textColor = RGBCOLOR(159, 159, 159);
    [self.contentView addSubview:distancelabel];
    
    
    UIImageView *moreImageView = [[UIImageView alloc] initWithFrame:CGRectMake(135, 80, 10, 2)];
    [moreImageView setImage:[UIImage imageNamed:@"03-1_24.png"]];
    [self.contentView addSubview:moreImageView];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(75, 87, 130, 1)];
    [lineImage setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:lineImage];
    lineImage.alpha = 0.2;
    
    pricelabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 87, 100, 30)];
    pricelabel.text = @"￥ 12.00";
    pricelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    pricelabel.textColor = RGBCOLOR(242, 66, 146);
    [self.contentView addSubview:pricelabel];
    
    goodImage = [[UIImageView alloc] initWithFrame:CGRectMake(170, 97, 10, 8.5)];
    [goodImage setImage:[UIImage imageNamed:@"03-1_17.png"]];
    [self.contentView addSubview:goodImage];
    
    goodlabel = [[UILabel alloc] initWithFrame:CGRectMake(185, 86, 100, 30)];
    goodlabel.text = @"";
    goodlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    goodlabel.textColor = RGBCOLOR(159, 159, 159);
    [self.contentView addSubview:goodlabel];
    
    bigImage = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"nature.jpg"]];
    bigImage.frame = CGRectMake(210, 12, 100, 100);
    [self.contentView addSubview:bigImage];
    
    contentNamelabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 5, 30, 30)];
    contentNamelabel.text = @"";
    contentNamelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    contentNamelabel.textColor = RGBCOLOR(50, 118, 243);
    [self.contentView addSubview:contentNamelabel];
    
    contentlabel = [[UILabel alloc] initWithFrame:CGRectMake(contentNamelabel.frame.size.width+contentNamelabel.frame.origin.x+5, 5, 100, 30)];
    contentlabel.text = @"";
    contentlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self.contentView addSubview:contentlabel];
    
    contentNamelabel2 = [[UILabel alloc] initWithFrame:CGRectMake(75, 25, 30, 30)];
    contentNamelabel2.text = @"";
    contentNamelabel2.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    contentNamelabel2.textColor = RGBCOLOR(50, 118, 243);
    [self.contentView addSubview:contentNamelabel2];
    
    contentlabel2 = [[UILabel alloc] initWithFrame:CGRectMake(contentNamelabel2.frame.size.width+contentNamelabel2.frame.origin.x+5, 25, 100, 30)];
    contentlabel2.text = @"";
    contentlabel2.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self.contentView addSubview:contentlabel2];
    
    contentNamelabel3 = [[UILabel alloc] initWithFrame:CGRectMake(75, 45, 30, 30)];
    contentNamelabel3.text = @"";
    contentNamelabel3.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    contentNamelabel3.textColor = RGBCOLOR(50, 118, 243);
    [self.contentView addSubview:contentNamelabel3];
    
    contentlabel3 = [[UILabel alloc] initWithFrame:CGRectMake(contentNamelabel3.frame.size.width+contentNamelabel3.frame.origin.x+5, 45, 100, 30)];
    contentlabel3.text = @"";
    contentlabel3.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    [self.contentView addSubview:contentlabel3];
}

-(void)setReleaseEvent:(ReleaseEvent *)releaseEvent{
    pricelabel.text = [NSString stringWithFormat:@"￥ %@",releaseEvent.price];
    bigImage.imageURL = [NSURL URLWithString:releaseEvent.content];
    goodlabel.text = releaseEvent.likes;
    if([releaseEvent.likes intValue] >0){
        [goodImage setImage:[UIImage imageNamed:@"04_07"]];
    }
    if(releaseEvent.comments.count !=0){
        for(int i=0;i<releaseEvent.comments.count;i++){
            if(i==0){
                if(![[NSString stringWithFormat:@"%@",releaseEvent.comments[0]]isEqualToString:@"<null>"]){
                    contentNamelabel.text = releaseEvent.comments[0][@"nickname"];
                    contentlabel.text = releaseEvent.comments[0][@"content"];
                }
            }else if(i==1){
                if(![[NSString stringWithFormat:@"%@",releaseEvent.comments[1]]isEqualToString:@"<null>"]){
                    contentNamelabel2.text = releaseEvent.comments[1][@"nickname"];
                    contentlabel2.text = releaseEvent.comments[1][@"content"];
                }
            }else{
                if(![[NSString stringWithFormat:@"%@",releaseEvent.comments[2]]isEqualToString:@"<null>"]){
                    contentNamelabel3.text = releaseEvent.comments[2][@"nickname"];
                    contentlabel3.text = releaseEvent.comments[2][@"content"];
                }
            }
        }
    }else{
        contentNamelabel.text = @"";
        contentlabel.text = @"";
        contentNamelabel2.text = @"";
        contentlabel2.text = @"";
        contentNamelabel3.text = @"";
        contentlabel3.text = @"";
    }
    if(![[NSString stringWithFormat:@"%@",releaseEvent.createdby]isEqualToString:@"<null>"]){
        headView.imageURL = [NSURL URLWithString:releaseEvent.createdby[@"avatar"]];
        namelabel.text = releaseEvent.createdby[@"nickname"];
    }
}
@end
