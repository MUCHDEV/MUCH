//
//  DetailHeadTableViewCell.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailHeadDelegate <NSObject>

-(void)showAlertView;
-(void)showLoginView;
-(void)showAnimation;
@end
@interface DetailHeadTableViewCell : UITableViewCell{
    NSString *imageUrl;
    NSString *postId;
    NSString *youlikeit;
}
@property(nonatomic,weak)id<DetailHeadDelegate>delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier imgUrl:(NSString *)imgUrl aid:(NSString *)aid like:(NSString *)like;
@end
