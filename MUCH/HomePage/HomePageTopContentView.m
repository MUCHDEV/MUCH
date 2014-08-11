//
//  HomePageTopContentView.m
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageTopContentView.h"

@implementation HomePageTopContentView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame index:(int)index
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 120, 30)];
        label.text = @"所有的内容";
        label.tag = 0;
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:15];
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        [tapGestureRecognizer addTarget:self action:@selector(choseView:)];
        [tapGestureRecognizer setNumberOfTapsRequired:1];
        [tapGestureRecognizer setNumberOfTouchesRequired:1];
        [label addGestureRecognizer:tapGestureRecognizer];
        [self addSubview:label];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 300, 30)];
        label1.text = @"关注的人发布优先";
        label1.tag = 1;
        label1.font = [UIFont fontWithName:@"GurmukhiMN" size:15];
        label1.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] init];
        [tapGestureRecognizer1 addTarget:self action:@selector(choseView:)];
        [tapGestureRecognizer1 setNumberOfTapsRequired:1];
        [tapGestureRecognizer1 setNumberOfTouchesRequired:1];
        [label1 addGestureRecognizer:tapGestureRecognizer1];
        [self addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, 300, 30)];
        label2.text = @"距离最近的发布优先";
        label2.tag = 2;
        label2.font = [UIFont fontWithName:@"GurmukhiMN" size:15];
        label2.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] init];
        [tapGestureRecognizer2 addTarget:self action:@selector(choseView:)];
        [tapGestureRecognizer2 setNumberOfTapsRequired:1];
        [tapGestureRecognizer2 setNumberOfTouchesRequired:1];
        [label2 addGestureRecognizer:tapGestureRecognizer2];
        [self addSubview:label2];
        
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 109, 320, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [self addSubview:lineImage];
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        if(index == 1){
            [arrowImage setFrame:CGRectMake(290, 45, 15, 17.5)];
            [arrowImage setImage:[UIImage imageNamed:@"03-1_03.png"]];
        }else if(index == 2){
            [arrowImage setFrame:CGRectMake(290, 80, 15, 17.5)];
            [arrowImage setImage:[UIImage imageNamed:@"03-1_03.png"]];
        }else{
            [arrowImage setFrame:CGRectMake(290, 10, 15, 17.5)];
            [arrowImage setImage:[UIImage imageNamed:@"03-1_03.png"]];
        }
        [self addSubview:arrowImage];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)choseView:(UITapGestureRecognizer *)sender{
    if([delegate respondsToSelector:@selector(choseView:)]){
        [delegate choseView:sender.view.tag];
    }
}
@end
