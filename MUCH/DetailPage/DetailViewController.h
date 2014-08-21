//
//  DetailViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolView.h"
#import "ReleaseEvent.h"
#import "LoginViewController.h"
#import "RegisterEvent.h"
#import "DetailHeadTableViewCell.h"
#import "LYMovePathView.h"
#import "LYFireworksView.h"
@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ToolViewDelegate,DetailHeadDelegate>{
    UITableView *_tableView;
    ToolView *toolview;
    NSMutableArray  *_allMessages;
    ReleaseEvent *releaseevent;
    NSString *imageurl;
    NSString *aid;
    NSString *price;
    NSString *headurl;
    NSString *nickName;
    NSString *youlikeit;
    LoginViewController *loginview;
    NSMutableArray *arr;
    RegisterEvent *regModel;
    LYMovePathView *animationView;
    LYFireworksView *animationView2;
    LYMovePathView *animationView3;
}
@property (nonatomic, strong) ReleaseEvent *releaseEvent;
@end
