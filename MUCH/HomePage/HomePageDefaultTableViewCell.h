//
//  HomePageDefaultTableViewCell.h
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol homePageDefaultDelegate <NSObject>

-(void)addImage;

@end
@interface HomePageDefaultTableViewCell : UITableViewCell{
    id<homePageDefaultDelegate>delegate;
}
@property(nonatomic,strong)id<homePageDefaultDelegate>delegate;
@end
