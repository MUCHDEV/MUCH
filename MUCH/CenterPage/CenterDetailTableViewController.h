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
@interface CenterDetailTableViewController : UITableViewController<UIActionSheetDelegate,CameraDelegate,UIActionSheetDelegate>{
    SinglePickerView *singlepickerview;
    UILabel *sexlabel;
    Camera *camera;
    UIActionSheet *_myActionSheet;
    UIImage *headImage;
    //图片2进制路径
    NSString* _filePath;
    LoginViewController *loginview;
}
@property(nonatomic,retain)NSMutableDictionary *dataDic;
@end
