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
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 47.5, 47.5)];
    [headView setImage:[UIImage imageNamed:@"06_11.png"]];
    [self addSubview:headView];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 140, 20)];
    name.text = @"Natalia Vodianova";
    name.textColor = [UIColor blackColor];
    name.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self addSubview:name];
    
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(70, 25, 140, 20)];
    price.text = @"￥10.24";
    price.textColor = [UIColor blackColor];
    price.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self addSubview:price];
    
    UILabel *distance = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 140, 20)];
    distance.text = @"距您120m";
    distance.textColor = [UIColor grayColor];
    distance.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    [self addSubview:distance];
}
@end
