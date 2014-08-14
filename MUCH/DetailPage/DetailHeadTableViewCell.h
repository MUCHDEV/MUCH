//
//  DetailHeadTableViewCell.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHeadTableViewCell : UITableViewCell{
    UIImage *image;
    int i;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier img:(UIImage *)img;
@end
