//
//  HomePageViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-8.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageTableViewCell.h"
@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MUCH";
    btnIndex = 0;
    //NavigationBar设置背景图
    self.navigationController.navigationBar.barTintColor = RGBCOLOR(255,228,19);
    
    //LeftButton设置属性
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 15.5, 21)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"03-1_06.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    //RightButton设置属性
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 21.5, 19.5)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"03-1_09"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    //NavigationItem设置属性
    UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 71.5, 23)];
    [titleview setImage:[UIImage imageNamed:@"字2_03.png"]];
    self.navigationItem.titleView = titleview;
    
    topview = [[HomePageTopView alloc] initWithFrame:CGRectMake(0, 65, 320, 50)];
    topview.delegate = self;
    [self.view addSubview:topview];
    
    showArr = [[NSMutableArray alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topview.frame.size.height+self.navigationController.navigationBar.frame.size.height+10, 320, self.view.frame.size.height-self.navigationController.navigationBar.frame.size.height-topview.frame.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    [_tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    [self.view addSubview:_tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)leftBtnClick{
    NSLog(@"leftBtnClick");
}

-(void)rightBtnClick{
    _myActionSheet = [[UIActionSheet alloc]
                      initWithTitle:nil
                      delegate:self
                      cancelButtonTitle:@"取消"
                      destructiveButtonTitle:nil
                      otherButtonTitles: @"打开照相机", @"从手机相册获取",nil];
    [_myActionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
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
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *stringcell = @"HomePageTableViewCell";
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
    if(!cell){
        cell = [[HomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

//homepagetop的delegate
-(void)openView{
    [topview removeFromSuperview];
    topview = nil;
    if(topcontentview == nil){
        topcontentview = [[HomePageTopContentView alloc] initWithFrame:CGRectMake(0,65, 320, 110) index:btnIndex];
        [topcontentview setBackgroundColor:[UIColor whiteColor]];
        topcontentview.delegate = self;
        [self.view addSubview:topcontentview];
        topcontentview.alpha = 0.9;
    }
}

//homepagetopcontent的delegate
-(void)choseView:(NSInteger)index{
    [topcontentview removeFromSuperview];
    topcontentview = nil;
    if(topview == nil){
        topview = [[HomePageTopView alloc] initWithFrame:CGRectMake(0, 65, 320, 50)];
        topview.delegate = self;
        [self.view addSubview:topview];
    }
    btnIndex = (int)index;
}

//caera的delegate
-(void)setBigImage:(UIImage *)img{
    releasepageview = [[ReleasePageViewController alloc] init];
    releasepageview.image = img;
    [self.navigationController pushViewController:releasepageview animated:YES];
}
@end
