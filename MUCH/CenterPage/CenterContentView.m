//
//  CenterContentView.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "CenterContentView.h"
#import "ReleaseEvent.h"
#import "EGOImageView.h"
@implementation CenterContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
+(CenterContentView *)setFram:(NSMutableArray *)imgArr{
    //NSLog(@"%@",imgArr);
    CenterContentView *centercontent = [[CenterContentView alloc] init];
    [centercontent setBackgroundColor:[UIColor clearColor]];
    int imgcount = imgArr.count;
    if(imgcount%3==0){
        [centercontent setFrame:CGRectMake(35, 15, 95*3, 105*(imgcount/3)+22.5)];
    }else{
        [centercontent setFrame:CGRectMake(35, 15, 95*3, 105*(imgcount/3)+127.5)];
    }
    //NSLog(@"%d",imgcount);
    for(int i=0;i<imgcount;i++){
        int row = i/3;
        int line = i%3;
        UIImageView *bgImage = [[UIImageView alloc] init];
        [bgImage setBackgroundColor:[UIColor whiteColor]];
        [bgImage setFrame:CGRectMake(line*(90+5), row*(105+5), 90, 90)];
        EGOImageView *contentImage = [[EGOImageView alloc] initWithFrame:CGRectMake(2, 2, 90-4, 90-4)];
        contentImage.imageURL = [NSURL URLWithString:imgArr[i][@"content"]];
        [bgImage addSubview:contentImage];
        [centercontent addSubview:bgImage];
        
        UILabel *pricelabel = [[UILabel alloc] init];
        [pricelabel setFrame:CGRectMake(line*(90+5), row*(105+5)+88, 90, 30)];
        pricelabel.text = [NSString stringWithFormat:@"￥ %@",imgArr[i][@"title"]];
        pricelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        pricelabel.textColor = RGBCOLOR(20, 118, 243);
        [centercontent addSubview:pricelabel];
    }
    return centercontent;
}
@end
