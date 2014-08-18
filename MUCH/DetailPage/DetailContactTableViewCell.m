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
    headView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 47.5, 47.5)];
    [headView setImage:[UIImage imageNamed:@"06_11.png"]];
    [self.contentView addSubview:headView];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 140, 20)];
    nameLabel.text = @"Natalia Vodianova";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self.contentView addSubview:nameLabel];
    
    priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 25, 140, 20)];
    priceLabel.text = @"￥10.24";
    priceLabel.textColor = [UIColor blackColor];
    priceLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self.contentView addSubview:priceLabel];
    
    distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 140, 20)];
    distanceLabel.text = @"距您120m";
    distanceLabel.textColor = [UIColor grayColor];
    distanceLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self.contentView addSubview:distanceLabel];
}

-(void)setPrice:(NSString *)price{
    priceLabel.text = [NSString stringWithFormat:@"￥ %@",price];
}
@end
