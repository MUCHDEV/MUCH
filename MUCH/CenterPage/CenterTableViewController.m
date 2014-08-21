//
//  CenterTableViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "CenterTableViewController.h"
#import "CenterTableViewCell.h"
#import "ReleaseEvent.h"
#import "ConnectionAvailable.h"
#import "MBProgressHUD.h"
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
    /*UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [titleview setImage:[UIImage imageNamed:@"03-2_033.png"]];
    self.navigationItem.titleView = titleview;*/
    
    [self.tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    self.tableView.separatorStyle = NO;
    
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:1];
    }else{
        viewArr = [[NSMutableArray alloc] init];
        dateArr = [[NSMutableArray alloc] init];
        [ReleaseEvent GetMyListWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                showArr = posts;
                NSLog(@"%@",posts);
                for(int i=0; i<[[posts[0] allKeys]count];i++){
                    // NSLog(@"%@",[posts[0] objectForKey:[posts[0] allKeys][i]]);
                    centercontentview = [CenterContentView setFram:[posts[0] objectForKey:[posts[0] allKeys][i]]];
                    [viewArr insertObject:centercontentview atIndex:0];
                    [dateArr insertObject:[posts[0] allKeys][i] atIndex:0];
                }
                [self.tableView reloadData];
            }
        } aid:[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
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
    NSLog(@"%d",[[showArr[0] allKeys]count]);
    return [[showArr[0] allKeys]count]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        NSString *stringcell = @"CenterTableViewCell";
        CenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[CenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
        }else{
            [cell setNewContent];
        }
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
        if(viewArr.count !=0){
            centercontentview = [viewArr objectAtIndex:indexPath.row-1];
            [cell.contentView addSubview:centercontentview];
            
            //NSLog(@"%f",cell.frame.size.height);
            UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 1, centercontentview.frame.size.height)];
            [lineImageView setBackgroundColor:RGBCOLOR(203, 203, 203)];
            [cell.contentView addSubview:lineImageView];
            
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(1, 15, 30, 30)];
            [imageview setImage:[UIImage imageNamed:@"06_18.png"]];
            [cell.contentView addSubview:imageview];
            
            NSArray *arr = [dateArr[indexPath.row-1] componentsSeparatedByString:@"-"];
            
            UILabel *day = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 30, 10)];
            day.text = [NSString stringWithFormat:@"%@",[arr objectAtIndex:2]];
            day.font = [UIFont fontWithName:@"GurmukhiMN" size:13];
            day.textColor = [UIColor whiteColor];
            day.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:day];
            
            UILabel *month = [[UILabel alloc] initWithFrame:CGRectMake(1, 32, 30, 10)];
            month.text = [NSString stringWithFormat:@"%d月",[[arr objectAtIndex:1] integerValue]];
            month.font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:9];
            month.textColor = [UIColor whiteColor];
            month.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:month];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"%d",indexPath.row);
    if(indexPath.row == 0){
        return 70;
    }else{
        if(viewArr.count !=0){
            centercontentview = [viewArr objectAtIndex:indexPath.row-1];
            //NSLog(@"%f",centercontentview.frame.size.height);
            return centercontentview.frame.size.height;
        }
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        detailview = [[CenterDetailTableViewController alloc] init];
        [self.navigationController pushViewController:detailview animated:YES];
    }
}
@end
