//
//  HomePageTopView.h
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol homePageTopDelegate <NSObject>

-(void)openView:(BOOL)isSelect;

@end
@interface HomePageTopView : UIView{
    UIImageView *arrowImage;
    UIImageView *lineImage;
    id<homePageTopDelegate>delegate;
    BOOL _isSelect;
}
@property(nonatomic,strong)id<homePageTopDelegate>delegate;
@end
