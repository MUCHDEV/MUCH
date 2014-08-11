//
//  HomePageTopContentView.m
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageTopContentView.h"

@implementation HomePageTopContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 40)];
        label.text = @"关注的人发布优先";
        label.tag = 0;
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:15];
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        [tapGestureRecognizer addTarget:self action:@selector(choseView:)];
        [tapGestureRecognizer setNumberOfTapsRequired:1];
        [tapGestureRecognizer setNumberOfTouchesRequired:1];
        [label addGestureRecognizer:tapGestureRecognizer];
        [self addSubview:label];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 300, 40)];
        label2.text = @"距离最近的发布优先";
        label2.tag = 1;
        label2.font = [UIFont fontWithName:@"GurmukhiMN" size:15];
        label2.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] init];
        [tapGestureRecognizer2 addTarget:self action:@selector(choseView:)];
        [tapGestureRecognizer2 setNumberOfTapsRequired:1];
        [tapGestureRecognizer2 setNumberOfTouchesRequired:1];
        [label2 addGestureRecognizer:tapGestureRecognizer2];
        [self addSubview:label2];
        
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 84, 320, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [self addSubview:lineImage];
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
    if(sender.view.tag == 0){
    
    }else{
    
    }
}
@end
