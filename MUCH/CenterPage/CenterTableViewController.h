//
//  CenterTableViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterContentView.h"
#import "CenterDetailTableViewController.h"
@interface CenterTableViewController : UITableViewController{
    NSMutableArray *viewArr;
    NSMutableArray *imageArr;
    CenterContentView *centercontentview;
    CenterDetailTableViewController *detailview;
    NSMutableArray *showArr;
    NSMutableArray *dateArr;
}

@end
