//
//  CenterDetailTableViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-13.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinglePickerView.h"
#import "Camera.h"
#import "LoginViewController.h"
#import "EGOImageView.h"
#import "RegisterEvent.h"
@interface CenterDetailTableViewController : UITableViewController<UIActionSheetDelegate,CameraDelegate,UIActionSheetDelegate,UITextFieldDelegate>{
    SinglePickerView *singlepickerview;
    UILabel *sexlabel;
    Camera *camera;
    UIActionSheet *_myActionSheet;
    UIImage *headImage;
    LoginViewController *loginview;
    UITextField *nick;
    NSMutableArray *showArr;
    RegisterEvent *model;
}
@end
