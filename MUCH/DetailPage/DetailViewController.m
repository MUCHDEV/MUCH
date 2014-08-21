//
//  DetailViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailHeadTableViewCell.h"
#import "DetailContactTableViewCell.h"
#import "DetailContentTableViewCell.h"
#import "GTMBase64.h"
#import "ConnectionAvailable.h"
#import "MBProgressHUD.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    //LeftButton设置属性
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 12.5, 21.5)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"06_03.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    //RightButton设置属性
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 22, 39/2)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"04_03"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 320, self.view.frame.size.height-44)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    [_tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    [self.view addSubview:_tableView];
    
    toolview = [[ToolView alloc] initWithFrame:CGRectMake(0, 524, 320, 44) superView:self.view];
    toolview.delegate = self;
    [self.view addSubview:toolview];
    
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:1];
    }else{
        [Message GetCommentsWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                _allMessages = [NSMutableArray array];
                for (NSDictionary *dict in posts[0]) {
                    Message *message = [[Message alloc] init];
                    message.dict = dict;
                    message.name = [dict objectForKey:@"nickname"];
                    message.content = [dict objectForKey:@"content"];
                    message.iconURL = [NSURL URLWithString:[dict objectForKey:@"avatar"]];
                    message.aid = aid;
                    if([[dict objectForKey:@"type"] isEqualToString:@"1"]){
                        message.type = MessageTypeOther;
                    }else{
                        message.type = MessageTypeMe;
                    }
                    [_allMessages addObject:message];
                }
                [_tableView reloadData];
            }
        } aid:aid];
    }
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
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtnClick{
    NSLog(@"rightBtnClick");
}

#pragma mark 给数据源增加内容
- (void)addMessageWithContent:(NSString *)content{
    if(![[NSUserDefaults standardUserDefaults]objectForKey:@"id"]){
        loginview = [[LoginViewController alloc] init];
        [self presentViewController:loginview animated:YES completion:nil];
    }else{
        Message *msg = [[Message alloc] init];
        msg.content = content;
        msg.type = MessageTypeMe;
        if([[NSUserDefaults standardUserDefaults]objectForKey:@"nickname"]){
            if(![[[NSUserDefaults standardUserDefaults]objectForKey:@"nickname"] isEqualToString:@""]){
                msg.name =[[NSUserDefaults standardUserDefaults]objectForKey:@"nickname"];
            }else{
                msg.name = @"匿名";
            }
        }else{
            msg.name = @"匿名";
        }
        NSLog(@"====>%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"avatar"]);
        msg.iconURL = [NSURL URLWithString:[[NSUserDefaults standardUserDefaults]objectForKey:@"avatar"] ];
        msg.aid = aid;
        [_allMessages insertObject:msg atIndex:0];
        [_tableView reloadData];
        // 3、滚动至当前行
        //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_allMessages.count - 1 inSection:0];
        //[_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        if (![ConnectionAvailable isConnectionAvailable]) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.removeFromSuperViewOnHide =YES;
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"当前网络不可用，请检查网络连接！";
            hud.labelFont = [UIFont fontWithName:nil size:14];
            hud.minSize = CGSizeMake(132.f, 108.0f);
            [hud hide:YES afterDelay:1];
        }else{
            [Message CommentsWithBlock:^(NSMutableArray *posts, NSError *error) {
                if(!error){
                    NSLog(@"posts ==> %@",posts);
                }
            } arr:_allMessages];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        NSString *stringcell = @"DetailHeadTableViewCell";
        DetailHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[DetailHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell imgUrl:imageurl aid:aid like:youlikeit] ;
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        NSString *stringcell = @"DetailContactTableViewCell";
        DetailContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[DetailContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
        }
        cell.price = price;
        cell.headurl = headurl;
        cell.name = nickName;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        NSString *stringcell = @"DetailContentTableViewCell%d";
        DetailContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[DetailContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell indexRow:indexPath.row arrCount:[_allMessages count]] ;
        }else{
            [cell setNewBgView:indexPath.row-1 newArrCount:[_allMessages count]];
        }
        cell.messageModel = _allMessages[indexPath.row-2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_allMessages count]+2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 249;
    }else if(indexPath.row == 1){
        return 60;
    }else if (indexPath.row == 2){
        return 109/2;
    }
    return 98/2;
}

-(void)setReleaseEvent:(ReleaseEvent *)releaseEvent{
    imageurl = releaseEvent.content;
    aid = releaseEvent.aid;
    price = releaseEvent.price;
    youlikeit = releaseEvent.youlikeit;
    if(![[NSString stringWithFormat:@"%@",releaseEvent.createdby] isEqualToString:@"<null>"]){
        headurl = releaseEvent.createdby[@"avatar"];
        nickName = releaseEvent.createdby[@"nickname"];
    }else{
        nickName = @"匿名";
        headurl = @"";
    }
}

-(void)showAlertView{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.removeFromSuperViewOnHide =YES;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"当前网络不可用，请检查网络连接！";
    hud.labelFont = [UIFont fontWithName:nil size:14];
    hud.minSize = CGSizeMake(132.f, 108.0f);
    [hud hide:YES afterDelay:1];
}

-(void)showLoginView{
    loginview = [[LoginViewController alloc] init];
    [self presentViewController:loginview animated:YES completion:nil];
}

-(void)showAnimation{
    // 第一条移动星星闪烁动画
    do {
        CGMutablePathRef path = CGPathCreateMutable();
        
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddCurveToPoint(path, NULL, 50.0, 100.0, 50.0, 120.0, 50.0, 275.0);
        CGPathAddCurveToPoint(path, NULL, 50.0, 275.0, 150.0, 275.0, 160.0, 160.0);
        
        animationView = [[LYMovePathView alloc] initWithFrame:CGRectMake(0, 0, 320, 320) movePath:path];
        [self.view addSubview:animationView];
    } while (0);
    
    // 第二条移动星星闪烁动画
    do {
        CGMutablePathRef path = CGPathCreateMutable();
        
        CGPathMoveToPoint(path, NULL, 320 - 0, 320 - 0);
        CGPathAddCurveToPoint(path, NULL, 320 - 50.0, 320 - 100.0, 320 - 50.0, 320 - 120.0, 320 - 50.0, 320 - 275.0);
        CGPathAddCurveToPoint(path, NULL, 320 - 50.0, 320 - 275.0, 320 - 150.0, 320 - 275.0, 160.0, 160.0);
        
        animationView3 = [[LYMovePathView alloc] initWithFrame:CGRectMake(0, 0, 320, 320) movePath:path];
        [self.view addSubview:animationView3];
    } while (0);
    
    // 祝贺花筒，彩色炮竹
    do {
        animationView2 = [[LYFireworksView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [self.view addSubview:animationView2];
    } while (0);
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector: @selector(closeAnimation)  userInfo:nil repeats:NO];
}

-(void)closeAnimation{
    do {
        [animationView removeFromSuperview];
        animationView = nil;
    } while (0);
    
    do {
        [animationView3 removeFromSuperview];
        animationView3 = nil;
    } while (0);
    
    [animationView2 removeFromSuperview];
    animationView2 = nil;
}
@end
