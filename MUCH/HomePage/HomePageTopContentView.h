//
//  HomePageTopContentView.h
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol homePageTopContentDelegate <NSObject>

-(void)choseView:(NSInteger)index;

@end
@interface HomePageTopContentView : UIView{
    id<homePageTopContentDelegate>delegate;
}
@property(nonatomic,strong)id<homePageTopContentDelegate>delegate;
- (id)initWithFrame:(CGRect)frame index:(int)index;
@end
