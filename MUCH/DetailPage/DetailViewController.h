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
@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ToolViewDelegate>{
    UITableView *_tableView;
    ToolView *toolview;
    NSMutableArray  *_allMessages;
    ReleaseEvent *releaseevent;
    NSString *imageurl;
    NSString *aid;
    NSString *price;
    NSString *headurl;
    NSString *nickName;
    LoginViewController *loginview;
    NSMutableArray *arr;
    RegisterEvent *regModel;
}
@property (nonatomic, strong) ReleaseEvent *releaseEvent;
@end
