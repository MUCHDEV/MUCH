//
//  CenterTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "CenterTableViewCell.h"

@implementation CenterTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        [RegisterEvent GetUserWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                model = posts[0];
                [self setContent];
            }
        }];
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
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 1, 70)];
    [lineImageView setBackgroundColor:RGBCOLOR(203, 203, 203)];
    [self.contentView addSubview:lineImageView];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 320, 60)];
    [bgImageView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:bgImageView];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 69, 320, 1)];
    [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
    [self.contentView addSubview:lineImage];
    
    headImage = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"03-1_30副本"]];
    headImage.frame = CGRectMake(20, 15, 47.5, 47.5);
    headImage.imageURL = [NSURL URLWithString:model.avatar];
    headImage.layer.cornerRadius = 23.75;
    headImage.layer.masksToBounds = YES;
    [self.contentView addSubview:headImage];
    
    namelabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 20, 100, 40)];
    namelabel.text = model.nickname;
    namelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:18];
    [self.contentView addSubview:namelabel];
    
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 30, 10, 33/2)];
    [arrowImage setImage:[UIImage imageNamed:@"03_03.png"]];
    [self.contentView addSubview:arrowImage];
}

-(void)setNewContent{
    [RegisterEvent GetUserWithBlock:^(NSMutableArray *posts, NSError *error) {
        if(!error){
            model = posts[0];
            headImage.imageURL = [NSURL URLWithString:model.avatar];
            namelabel.text = model.nickname;
        }
    }];
}
@end
