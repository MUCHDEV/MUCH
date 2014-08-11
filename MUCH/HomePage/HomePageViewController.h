//
//  HomePageViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-8.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageTopView.h"
#import "HomePageTopContentView.h"
#import "Camera.h"
#import "ReleasePageViewController.h"
#import "HomePageTableViewCell.h"
#import "HomePageDefaultTableViewCell.h"
@interface HomePageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,homePageTopDelegate,homePageTopContentDelegate,UIActionSheetDelegate,CameraDelegate,homePageDefaultDelegate>{
    HomePageTopView *topview;
    HomePageTopContentView *topcontentview;
    UITableView *_tableView;
    NSMutableArray *showArr;
    int btnIndex;
    UIActionSheet *_myActionSheet;
    Camera *camera;
    ReleasePageViewController *releasepageview;
}

@end
