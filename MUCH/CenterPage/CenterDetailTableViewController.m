//
//  CenterDetailTableViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-13.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "CenterDetailTableViewController.h"

@interface CenterDetailTableViewController ()

@end

@implementation CenterDetailTableViewController

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
    
    //NavigationItem设置属性
    UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 71.5, 23)];
    [titleview setImage:[UIImage imageNamed:@"字2_03.png"]];
    self.navigationItem.titleView = titleview;
    
    [self.tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    self.tableView.separatorStyle = NO;
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
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
    NSString *stringcell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setBackgroundColor:[UIColor clearColor]];
    
    if(indexPath.row == 0){
        UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 320, 63)];
        [bgImage setBackgroundColor:[UIColor whiteColor]];
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 62, 280, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [bgImage addSubview:lineImage];
        [cell.contentView addSubview:bgImage];
        UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 28, 10, 33/2)];
        [arrowImage setImage:[UIImage imageNamed:@"03_03.png"]];
        [cell.contentView addSubview:arrowImage];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 100, 40)];
        label.text = @"头像";
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        [cell.contentView addSubview:label];
        
        UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(232, 12, 47.5, 47.5)];
        [headView setImage:[UIImage imageNamed:@"06_11.png"]];
        [cell.contentView addSubview:headView];
    }else if(indexPath.row == 1){
        UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 63)];
        [bgImage setBackgroundColor:[UIColor whiteColor]];
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 62, 280, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [bgImage addSubview:lineImage];
        [cell.contentView addSubview:bgImage];
        UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 28, 10, 33/2)];
        [arrowImage setImage:[UIImage imageNamed:@"03_03.png"]];
        [cell.contentView addSubview:arrowImage];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 100, 40)];
        label.text = @"昵称";
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        [cell.contentView addSubview:label];
        
        UILabel *nicklabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 15, 140, 40)];
        nicklabel.text = @"Natalia Vodianova";
        nicklabel.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        nicklabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:nicklabel];
    }else if (indexPath.row == 2){
        UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 63)];
        [bgImage setBackgroundColor:[UIColor whiteColor]];
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 62, 280, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [bgImage addSubview:lineImage];
        [cell.contentView addSubview:bgImage];
        UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 28, 10, 33/2)];
        [arrowImage setImage:[UIImage imageNamed:@"03_03.png"]];
        [cell.contentView addSubview:arrowImage];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 100, 40)];
        label.text = @"性别";
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        [cell.contentView addSubview:label];
        
        UILabel *sexlabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 15, 140, 40)];
        sexlabel.text = @"女";
        sexlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        sexlabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:sexlabel];
    }else if(indexPath.row == 3){
        UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 63)];
        [bgImage setBackgroundColor:[UIColor whiteColor]];
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 62, 320, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [bgImage addSubview:lineImage];
        [cell.contentView addSubview:bgImage];
        UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 28, 10, 33/2)];
        [arrowImage setImage:[UIImage imageNamed:@"03_03.png"]];
        [cell.contentView addSubview:arrowImage];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 100, 40)];
        label.text = @"手机号码";
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        [cell.contentView addSubview:label];
        
        UILabel *phonelabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 15, 140, 40)];
        phonelabel.text = @"13600000000";
        phonelabel.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        phonelabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:phonelabel];
    }else if (indexPath.row == 4){
        UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 31.5, 320, 51)];
        [bgImage setBackgroundColor:[UIColor whiteColor]];
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 320, 1)];
        [lineImage setImage:[UIImage imageNamed:@"07_03.png"]];
        [bgImage addSubview:lineImage];
        [cell.contentView addSubview:bgImage];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 30)];
        label.text = @"SNS绑定";
        label.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [cell.contentView addSubview:label];
        
        UIImageView *sinaImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 31, 31)];
        [sinaImage setImage:[UIImage imageNamed:@"07_11.png"]];
        [bgImage addSubview:sinaImage];
        
        UIImageView *qqImage = [[UIImageView alloc] initWithFrame:CGRectMake(71, 10, 31, 31)];
        [qqImage setImage:[UIImage imageNamed:@"07_13.png"]];
        [bgImage addSubview:qqImage];
    }else{
        UIButton *logout =  [UIButton buttonWithType:UIButtonTypeCustom];
        logout.frame = CGRectMake(23.75, 20, 545/2, 40);
        [logout setBackgroundImage:[UIImage imageNamed:@"09-2_19.png"] forState:UIControlStateNormal];
        [logout addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:logout];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 68;
    }else if(indexPath.row == 4){
        return 82.5;
    }else if(indexPath.row == 6){
        return 60;
    }
    return 63;
}

-(void)logoutClick{
    NSLog(@"logoutClick");
}
@end