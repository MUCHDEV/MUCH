//
//  HomePageViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-8.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UIView *topview;
    UITableView *_tableView;
    NSMutableArray *showArr;
}

@end
