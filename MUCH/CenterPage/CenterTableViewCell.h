//
//  CenterTableViewCell.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterEvent.h"
#import "EGOImageView.h"
@interface CenterTableViewCell : UITableViewCell{
    RegisterEvent *model;
    EGOImageView *headImage;
    UILabel *namelabel;
}
-(void)setNewContent;
@end
