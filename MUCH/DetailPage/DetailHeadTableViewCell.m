//
//  DetailHeadTableViewCell.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "DetailHeadTableViewCell.h"
#import "EGOImageView.h"
#import "ConnectionAvailable.h"
#import "MBProgressHUD.h"
#import "Message.h"
#import "LoginSqlite.h"
@implementation DetailHeadTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier imgUrl:(NSString *)imgUrl aid:(NSString *)aid like:(NSString *)like
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        imageUrl = imgUrl;
        postId = aid;
        youlikeit = like;
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
    EGOImageView *imageview = [[EGOImageView alloc] init];
    imageview.imageURL = [NSURL URLWithString:imageUrl];
    UIImage *srcimg = imageview.image;
    UIImageView *smallImageView = [[UIImageView alloc] init];
    smallImageView.frame = CGRectMake(4, 2, 601/2, 461/2);
    CGRect rect =  CGRectMake(19.5, 89.5, 601, 461);//要裁剪的图片区域，按照原图的像素大小来，超过原图大小的边自动适配
    CGImageRef cgimg = CGImageCreateWithImageInRect([srcimg CGImage], rect);
    smallImageView.image = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);//用完一定要释放，否则内存泄露
    [imageView addSubview:smallImageView];
    [self.contentView addSubview:imageView];
    
    UIButton *zanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [zanButton setFrame:CGRectMake(260, 190, 67/2, 67/2)];
    if([youlikeit isEqualToString:@"0"]){
        [zanButton setBackgroundImage:[UIImage imageNamed:@"04_09.png"] forState:UIControlStateNormal];
    }else{
        [zanButton setBackgroundImage:[UIImage imageNamed:@"04_07.png"] forState:UIControlStateNormal];
    }
    [zanButton addTarget:self action:@selector(zanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:zanButton];
}

-(void)zanBtnClick:(UIButton *)button{
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    [button.layer addAnimation:k forKey:@"SHOW"];
    if([[LoginSqlite getdata:@"userId"] isEqualToString:@""]){
        if([self.delegate respondsToSelector:@selector(showLoginView)]){
            [self.delegate showLoginView];
        }
    }else{
        if (![ConnectionAvailable isConnectionAvailable]) {
            if([self.delegate respondsToSelector:@selector(showAlertView)]){
                [self.delegate showAlertView];
            }
        }else{
            if([youlikeit isEqualToString:@"0"]){
                [Message LikeWithBlock:^(NSMutableArray *posts, NSError *error) {
                    if(!error){
                        //点赞动画
                        [button setBackgroundImage:[UIImage imageNamed:@"04_07.png"] forState:UIControlStateNormal];
                        youlikeit = @"1";
                        if([self.delegate respondsToSelector:@selector(showAnimation)]){
                            [self.delegate showAnimation];
                        }
                    }
                } aid:postId];
            }
        }
    }
}
@end
