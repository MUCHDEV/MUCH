//
//  ReleasePageViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReleasePageViewController : UIViewController<UITextFieldDelegate>{
    UIImage *image;
    UITextField *_priceTextField;
}
@property(nonatomic,retain)UIImage *image;
@end