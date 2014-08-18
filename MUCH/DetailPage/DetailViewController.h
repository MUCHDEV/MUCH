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
@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ToolViewDelegate>{
    UITableView *_tableView;
    ToolView *toolview;
    NSMutableArray  *_allMessages;
    ReleaseEvent *releaseevent;
    NSString *imageurl;
    NSString *aid;
    NSString *price;
    LoginViewController *loginview;
    NSMutableArray *arr;
}
@property (nonatomic, strong) ReleaseEvent *releaseEvent;
@end
