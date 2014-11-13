//
//  CenterDetailTableViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-13.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "CenterDetailTableViewController.h"
#import "RegisterEvent.h"
#import <QuartzCore/QuartzCore.h>
#import "GTMBase64.h"
#import "ConnectionAvailable.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "LoginSqlite.h"
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
    /*UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [titleview setImage:[UIImage imageNamed:@"03-2_033.png"]];
    self.navigationItem.titleView = titleview;*/
    
    [self.tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    self.tableView.separatorStyle = NO;
    self.tableView.scrollEnabled = NO;
    
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:1];
    }else{
        [RegisterEvent GetUserWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                NSLog(@"===>%@",posts);
                model = posts[0];
                [self.tableView reloadData];
            }
        }];
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
        
        
        EGOImageView *headView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"03-1_30副本"]];
        headView.frame = CGRectMake(232, 12, 47.5, 47.5);
        headView.layer.cornerRadius = 23.75;
        headView.layer.masksToBounds = YES;
        headView.imageURL = [NSURL URLWithString:model.avatar];
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
        
        nick = [[UITextField alloc] initWithFrame:CGRectMake(140, 15, 140, 40)];
        nick.text = model.nickname;
        nick.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        nick.textAlignment = NSTextAlignmentRight;
        nick.returnKeyType = UIReturnKeyDone;
        nick.delegate = self;
        [cell.contentView addSubview:nick];
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
        
        sexlabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 15, 140, 40)];
        sexlabel.text = model.gender;
        sexlabel.font = [UIFont fontWithName:@"GurmukhiMN" size:16];
        sexlabel.tag = indexPath.row;
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
        [logout setBackgroundImage:[UIImage imageNamed:@"07_033.png"] forState:UIControlStateNormal];
        [logout addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:logout];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [nick resignFirstResponder];
    [singlepickerview removeFromSuperview];
    singlepickerview = nil;
    if([[LoginSqlite getdata:@"userId"] isEqualToString:@""]){
        AppDelegate* app=[AppDelegate instance];
        [app initLoginView];
        [self presentViewController:app.loginView animated:YES completion:nil];
    }else{
        if(indexPath.row == 0){
            _myActionSheet = [[UIActionSheet alloc]
                              initWithTitle:nil
                              delegate:self
                              cancelButtonTitle:@"取消"
                              destructiveButtonTitle:nil
                              otherButtonTitles: @"打开照相机", @"从手机相册获取",nil];
            _myActionSheet.tag = 0;
            [_myActionSheet showInView:self.view];
        }else if(indexPath.row == 1){
            
        }else if(indexPath.row == 2){
            NSArray *arr = [[NSArray alloc] initWithObjects:@"男",@"女",nil];
            singlepickerview = [[SinglePickerView alloc] initWithTitle:CGRectMake(0, 0, 320, 260) title:nil Arr:arr delegate:self];
            singlepickerview.tag = 1;
            [singlepickerview showInView:self.view];
        }else{
            
        }
    }
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
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"id"];
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"avatar"];
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"nickname"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    [LoginSqlite deleteAll];
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"退出成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertview show];
}

//选择框
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.tag == 0){
        //呼出的菜单按钮点击后的响应
        if (buttonIndex == _myActionSheet.cancelButtonIndex)
        {
            NSLog(@"取消");
        }
        switch (buttonIndex)
        {
            case 0:  //打开照相机拍照
                camera = [[Camera alloc] init];
                camera.delegate = self;
                [camera getCameraView:self flag:0];
                break;
            case 1:  //打开本地相册
                camera = [[Camera alloc] init];
                camera.delegate = self;
                [camera getCameraView:self flag:1];
                break;
        }
    }else if(actionSheet.tag == 1){
        if(buttonIndex == 0) {
            NSLog(@"Cancel");
        }else {
            singlepickerview = (SinglePickerView *)actionSheet;
            sexlabel.text = singlepickerview.selectStr;
            model.gender = singlepickerview.selectStr;
            [RegisterEvent UpdataWithBlock:^(NSMutableArray *posts, NSError *error) {
                if(!error){
                    
                }
            } model:model];
        }
    }
    [self.tableView reloadData];
}

-(void)setBigImage:(UIImage *)img{
    /*headImage = img;
     NSData *data = UIImageJPEGRepresentation(img, 0.8);
    //图片保存的路径
    //这里将图片放在沙盒的documents文件夹中
    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
    [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
    [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
    //得到选择后沙盒中图片的完整路径
    _filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
    [self.tableView reloadData];*/
    NSData *photo = UIImageJPEGRepresentation(img, 0.8);
    NSString* encoded = [[NSString alloc] initWithData:[GTMBase64 encodeData:photo] encoding:NSUTF8StringEncoding];
    [RegisterEvent UpdataHeadWithBlock:^(NSMutableArray *posts, NSError *error) {
        if(!error){
            NSLog(@"posts ===>%@",posts);
            model.avatar = posts[0];
            //[[NSUserDefaults standardUserDefaults] setObject:posts[0] forKey:@"avatar"];
            [LoginSqlite insertData:posts[0] datakey:@"avatar"];
            [self.tableView reloadData];
        }
    } imaStr:encoded];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    textField.text = nil;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(![textField.text isEqualToString:@""]){
        model.nickname = textField.text;
        [RegisterEvent UpdataWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                //[[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"nickname"];
                [LoginSqlite insertData:textField.text datakey:@"nickname"];
            }
        } model:model];
    }
    [self.tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self.tableView reloadData];
    return YES;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
