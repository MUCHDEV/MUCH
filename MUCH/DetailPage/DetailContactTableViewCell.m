//
//  DetailContactTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "DetailContactTableViewCell.h"

@implementation DetailContactTableViewCell

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
    headView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"06_11副本.png"]];
    headView.frame = CGRectMake(15, 0, 47.5, 47.5);
    headView.layer.cornerRadius = 47.5/2;
    headView.layer.masksToBounds = YES;
    [self.contentView addSubview:headView];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 140, 20)];
    nameLabel.text = @"Natalia Vodianova";
    nameLabel.textColor = RGBCOLOR(24, 24, 24);
    nameLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self.contentView addSubview:nameLabel];
    
    priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 25, 140, 20)];
    priceLabel.text = @"￥10.24";
    priceLabel.textColor = RGBCOLOR(24, 24, 24);
    priceLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self.contentView addSubview:priceLabel];
    
    distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(175, 0, 140, 20)];
    distanceLabel.text = @"距您120m";
    distanceLabel.textColor = RGBCOLOR(159, 159, 159);
    distanceLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    distanceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:distanceLabel];
}

-(void)setPrice:(NSString *)price{
    priceLabel.text = [NSString stringWithFormat:@"￥ %@",price];
}

-(void)setHeadurl:(NSString *)headurl{
    headView.imageURL = [NSURL URLWithString:headurl];
}

-(void)setName:(NSString *)name{
    nameLabel.text = name;
}

-(void)setDistance:(NSString *)distance{
    distanceLabel.text = [NSString stringWithFormat:@"距您%@",distance];
}
@end
