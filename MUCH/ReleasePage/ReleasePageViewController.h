//
//  ReleasePageViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@protocol ReleasePageViewDelegate <NSObject>

-(void)reloadList;

@end
@interface ReleasePageViewController : UIViewController<UITextFieldDelegate>{
    UIImage *image;
    UITextField *_priceTextField;
    id<ReleasePageViewDelegate>delegate;
    LoginViewController *loginview;
}
@property(nonatomic,retain)UIImage *image;
@property(nonatomic,strong)id<ReleasePageViewDelegate>delegate;
@end
