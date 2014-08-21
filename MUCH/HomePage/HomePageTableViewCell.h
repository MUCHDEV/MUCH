//
//  HomePageTableViewCell.h
//  MUCH
//
//  Created by 汪洋 on 14-8-9.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReleaseEvent.h"
#import "EGOImageView.h"
@interface HomePageTableViewCell : UITableViewCell{
    UILabel *namelabel;
    UILabel *distancelabel;
    UILabel *contentNamelabel;
    UILabel *contentlabel;
    UILabel *contentNamelabel2;
    UILabel *contentlabel2;
    UILabel *contentNamelabel3;
    UILabel *contentlabel3;
    UILabel *pricelabel;
    UIImageView *goodImage;
    UILabel *goodlabel;
    EGOImageView *bigImage;
    EGOImageView *headView;
}
@property (nonatomic, strong) ReleaseEvent *releaseEvent;
@property (nonatomic, strong) EGOImageView *bigImage;
@end
