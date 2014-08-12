//
//  DetailHeadTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "DetailHeadTableViewCell.h"

@implementation DetailHeadTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier img:(UIImage *)img
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        image = img;
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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 616/2, 478/2)];
    [imageView setImage:[UIImage imageNamed:@"04-1_03.png"]];
    
    //图片裁剪
    UIImage *srcimg = image;
    UIImageView *smallImageView = [[UIImageView alloc] init];
    smallImageView.frame = CGRectMake(4, 2, 601/2, 461/2);
    CGRect rect =  CGRectMake(19.5, 89.5, 601, 461);//要裁剪的图片区域，按照原图的像素大小来，超过原图大小的边自动适配
    CGImageRef cgimg = CGImageCreateWithImageInRect([srcimg CGImage], rect);
    smallImageView.image = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);//用完一定要释放，否则内存泄露
    [imageView addSubview:smallImageView];
    [self addSubview:imageView];
    
    UIButton *zanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [zanButton setFrame:CGRectMake(270, 200, 67/2, 67/2)];
    [zanButton setBackgroundImage:[UIImage imageNamed:@"04_07.png"] forState:UIControlStateNormal];
    [zanButton addTarget:self action:@selector(zanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:zanButton];
}

-(void)zanBtnClick{
    NSLog(@"zanBtnClick");
}
@end
