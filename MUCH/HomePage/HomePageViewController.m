//
//  HomePageViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-8.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "HomePageViewController.h"
#import "ReleaseEvent.h"
#import "MJRefresh.h"
#import "ReleaseEvent.h"
#import "ConnectionAvailable.h"
#import "MBProgressHUD.h"
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
    startIndex = 0;
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
    /*UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [titleview setImage:[UIImage imageNamed:@"03-2_033.png"]];
    self.navigationItem.titleView = titleview;*/
    
    //[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"Yuanti SC Bold.otf" size:19], NSFontAttributeName,nil]];
    
    topview = [[HomePageTopView alloc] initWithFrame:CGRectMake(0, 65, 320, 50)];
    topview.delegate = self;
    [self.view addSubview:topview];
    
    showArr = [[NSMutableArray alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, 320, 474)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    [_tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    [self.view addSubview:_tableView];
    
    //集成刷新控件
    [self setupRefresh];
    
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:1];
    }else{
        [ReleaseEvent GetListWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                showArr = posts;
                [_tableView reloadData];
            }
        }start:startIndex];
    }
    
    
    locationManager = [[CLLocationManager alloc] init];//创建位置管理器
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=1000.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    //启动位置更新
    //[locationManager startUpdatingLocation];
    [self reloadList];
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

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    //[_tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
        [_tableView footerEndRefreshing];
        [_tableView headerEndRefreshing];
    }else{
        startIndex = 0;
        [showArr removeAllObjects];
        [ReleaseEvent GetListWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                //NSLog(@"posts ==> %@",posts);
                showArr = posts;
                [_tableView reloadData];
                [_tableView footerEndRefreshing];
                [_tableView headerEndRefreshing];
            }
        }start:startIndex];
    }
}

- (void)footerRereshing
{
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
        [_tableView footerEndRefreshing];
        [_tableView headerEndRefreshing];
    }else{
        startIndex = startIndex +5;
        [ReleaseEvent GetListWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                [showArr addObjectsFromArray:posts];
                [_tableView reloadData];
                [_tableView footerEndRefreshing];
                [_tableView headerEndRefreshing];
            }
        }start:startIndex];
    }
}

-(void)leftBtnClick{
    if(![[NSUserDefaults standardUserDefaults]objectForKey:@"id"]){
        loginview = [[LoginViewController alloc] init];
        [self presentViewController:loginview animated:YES completion:nil];
    }else{
        centerview = [[CenterTableViewController alloc] init];
        [self.navigationController pushViewController:centerview animated:YES];
    }
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
    if(showArr.count ==0){
        NSString *stringcell = @"HomePageDefaultTableViewCell";
        HomePageDefaultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[HomePageDefaultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        NSString *stringcell = @"HomePageTableViewCell";
        HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[HomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
        }
        cell.myNeedLong=(indexPath.row==showArr.count-1)?YES:NO;
        cell.releaseEvent = showArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [showArr count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(showArr.count ==0){
        return _tableView.frame.size.height;
    }else{
        return 130;
    }
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    detailview = [[DetailViewController alloc] init];
    detailview.releaseEvent = [showArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailview animated:YES];
}

//homepagetop的delegate
-(void)openView{
    topview.hidden = YES;
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
    //[topview removeFromSuperview];
    topview.hidden = NO;
    btnIndex = (int)index;
}

//caera的delegate
-(void)setBigImage:(UIImage *)img{
    releasepageview = [[ReleasePageViewController alloc] init];
    releasepageview.image = img;
    releasepageview.delegate = self;
    [self.navigationController pushViewController:releasepageview animated:YES];
}

-(void)addImage{
    [self rightBtnClick];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
    CLLocation *currentLocation = [locations lastObject];
    CLLocationCoordinate2D coor = currentLocation.coordinate;
    latitude =  coor.latitude;
    longitude = coor.longitude;
    [locationManager stopUpdatingLocation];
}


-(void)reloadList{
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
    }else{
        startIndex = 0;
        [showArr removeAllObjects];
        [ReleaseEvent GetListWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                //NSLog(@"posts ==> %@",posts);
                showArr = posts;
                [_tableView reloadData];
            }
        }start:startIndex];
    }
}
@end
