//
//  DetailContactTableViewCell.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DetailContactTableViewCell : UITableViewCell{
    UIImageView *headView;
    UILabel *nameLabel;
    UILabel *priceLabel;
    UILabel *distanceLabel;
}
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *distance;
@end
