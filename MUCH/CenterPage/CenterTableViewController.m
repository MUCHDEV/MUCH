//
//  CenterTableViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "CenterTableViewController.h"
#import "CenterTableViewCell.h"
@interface CenterTableViewController ()

@end

@implementation CenterTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //LeftButton设置属性
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 12.5, 21.5)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"06_03.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    //RightButton设置属性
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 37/2, 36/2)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"06_06.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    //NavigationItem设置属性
    UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 71.5, 23)];
    [titleview setImage:[UIImage imageNamed:@"字2_03.png"]];
    self.navigationItem.titleView = titleview;
    
    [self.tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    self.tableView.separatorStyle = NO;
    
    viewArr = [[NSMutableArray alloc] init];
    for(int i=0;i<5;i++){
        imageArr = [[NSMutableArray alloc] init];
        if(i == 0){
            [imageArr addObject:@"0"];
        }else if(i == 1){
            [imageArr addObject:@"0"];
            [imageArr addObject:@"1"];
        }else if(i == 2){
            [imageArr addObject:@"0"];
            [imageArr addObject:@"1"];
            [imageArr addObject:@"2"];
        }else if(i == 3){
            [imageArr addObject:@"0"];
            [imageArr addObject:@"1"];
            [imageArr addObject:@"2"];
            [imageArr addObject:@"3"];
        }else if(i == 4){
            [imageArr addObject:@"0"];
            [imageArr addObject:@"1"];
            [imageArr addObject:@"2"];
            [imageArr addObject:@"3"];
            [imageArr addObject:@"4"];
        }
        centercontentview = [CenterContentView setFram:imageArr priceArr:nil];
        [viewArr addObject:centercontentview];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtnClick{
    NSLog(@"rightBtnClick");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        NSString *stringcell = @"CenterTableViewCell";
        CenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[CenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
        }
        NSLog(@"%f",cell.frame.size.height);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        NSString *stringcell = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
        }
        for(int i=0;i<cell.contentView.subviews.count;i++) {
            [((UIView*)[cell.contentView.subviews objectAtIndex:i]) removeFromSuperview];
        }
        [cell setBackgroundColor:[UIColor clearColor]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        centercontentview = [viewArr objectAtIndex:indexPath.row-1];
        [cell.contentView addSubview:centercontentview];
        
        //NSLog(@"%f",cell.frame.size.height);
        UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 1, centercontentview.frame.size.height)];
        [lineImageView setBackgroundColor:RGBCOLOR(203, 203, 203)];
        [cell.contentView addSubview:lineImageView];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(1, 15, 30, 30)];
        [imageview setImage:[UIImage imageNamed:@"06_18.png"]];
        [cell addSubview:imageview];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"%d",indexPath.row);
    if(indexPath.row == 0){
        return 70;
    }else{
        centercontentview = [viewArr objectAtIndex:indexPath.row-1];
        //NSLog(@"%f",centercontentview.frame.size.height);
        return centercontentview.frame.size.height;
    }
    return 44;
}


@end
