//
//  HomePageTopView.m
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageTopView.h"

@implementation HomePageTopView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _isSelect = NO;
        lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 38, 320, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [self addSubview:lineImage];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 120, 30)];
        label.text = @"所有的内容";
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:15];
        [self addSubview:label];
        
        arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 12, 10, 16.5)];
        [arrowImage setImage:[UIImage imageNamed:@"03_03.png"]];
        [self addSubview:arrowImage];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        [tapGestureRecognizer addTarget:self action:@selector(openView)];
        [tapGestureRecognizer setNumberOfTapsRequired:1];
        [tapGestureRecognizer setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:tapGestureRecognizer];
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
-(void)openView{
    if(!_isSelect){
        [arrowImage setFrame:CGRectMake(290, 12, 15, 17.5)];
        [arrowImage setImage:[UIImage imageNamed:@"03-1_03.png"]];
        if([delegate respondsToSelector:@selector(openView:)]){
            [delegate openView:_isSelect];
        }
        lineImage.hidden = YES;
        _isSelect = YES;
    }else{
        [arrowImage setFrame:CGRectMake(290, 12, 10, 16.5)];
        [arrowImage setImage:[UIImage imageNamed:@"03_03.png"]];
        if([delegate respondsToSelector:@selector(openView:)]){
            [delegate openView:_isSelect];
        }
        lineImage.hidden = NO;
        _isSelect = NO;
    }
}
@end
